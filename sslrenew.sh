#!/bin/bash
# Let's Encrypt certificate for FixChap.
#  - Requests the certificate for every name in SERVER_NAMES whose DNS already points to this server.
#    Names that don't point here yet are skipped (with a note) instead of failing the whole request.
#  - Later runs add skipped names once their DNS is ready, otherwise renew when < 30 days are left.
#  - Switches nginx to HTTPS and reloads it.
# Renew automatically (as root, or a user in the docker group):
#   crontab -e  ->  0 3 * * 1 /opt/deployments/fixchap-deploy/sslrenew.sh >> /opt/deployments/fixchap-deploy/backups/ssl.log 2>&1
set -e
CUR_DIR=$(pwd)
DEPLOY_DIR="${DEPLOY_DIR:-/opt/deployments/fixchap-deploy}"
[ -d "$DEPLOY_DIR" ] || DEPLOY_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$DEPLOY_DIR"
if docker compose version >/dev/null 2>&1; then DC="docker compose"; else DC="docker-compose"; fi

. ./scripts/_env.sh
fixchap_load_env .env || { echo "Fix .env first (run ./scripts/check-env.sh)"; exit 1; }
[ -n "$PRIMARY_DOMAIN" ] && [ -n "$SERVER_NAMES" ] || { echo "Set SERVER_NAMES and PRIMARY_DOMAIN in .env"; exit 1; }
[ -n "$LETSENCRYPT_EMAIL" ] || { echo "Set LETSENCRYPT_EMAIL in .env (expiry warnings go there)"; exit 1; }
mkdir -p certbot/www certbot/conf
CERT="certbot/conf/live/$PRIMARY_DOMAIN/fullchain.pem"

echo "$(date '+%F %T') SSL check for: $SERVER_NAMES"

# ---- which names point to this server? ----
SERVER_IP="${SERVER_IP:-}"
[ -n "$SERVER_IP" ] || SERVER_IP=$(curl -s4 --max-time 8 https://api.ipify.org 2>/dev/null || true)
[ -n "$SERVER_IP" ] || SERVER_IP=$(curl -s4 --max-time 8 https://ifconfig.me 2>/dev/null || true)
[ -n "$SERVER_IP" ] || { echo "Can't find this server's public IP — set SERVER_IP=... in .env"; exit 1; }

# A name is ready when public resolvers (Cloudflare AND Google, or the system resolver without dig)
# all return this server's IP — recently changed records can take up to an hour to agree.
points_here() {
  local r ips
  if command -v dig >/dev/null 2>&1; then
    for r in 1.1.1.1 8.8.8.8; do
      ips=" $(dig +short A "$1" @$r 2>/dev/null | tr '\n' ' ') "
      [[ "$ips" == *" $SERVER_IP "* ]] || { echo "$r: ${ips// /}"; return 1; }
    done
  else
    ips=" $(getent ahostsv4 "$1" 2>/dev/null | awk '{print $1}' | sort -u | tr '\n' ' ') "
    [[ "$ips" == *" $SERVER_IP "* ]] || { echo "${ips// /}"; return 1; }
  fi
}

ready=(); skipped=()
for d in $SERVER_NAMES; do
  if ips=$(points_here "$d"); then
    ready+=("$d")
  else
    skipped+=("$d")
    echo "  ! skipping $d — not pointing here yet (${ips:-no address}); this server is $SERVER_IP"
  fi
done
if [ ${#ready[@]} -eq 0 ]; then
  echo "✗ None of SERVER_NAMES points to $SERVER_IP yet. Add DNS A records (value $SERVER_IP), wait, and run again."
  exit 1
fi

# ---- names already in the certificate ----
have=()
if [ -f "$CERT" ]; then
  have=($(openssl x509 -in "$CERT" -noout -text 2>/dev/null | grep -o 'DNS:[^,]*' | sed 's/DNS://' | tr -d ' '))
fi
missing=()
for d in "${ready[@]}"; do [[ " ${have[*]} " == *" $d "* ]] || missing+=("$d"); done

if [ ! -f "$CERT" ] || [ ${#missing[@]} -gt 0 ]; then
  if [ -f "$CERT" ]; then echo "Adding to the certificate: ${missing[*]}"; else echo "No certificate yet — requesting one for: ${ready[*]}"; fi

  # nginx must answer the Let's Encrypt check over plain HTTP (the HTTPS config does that too)
  [ -d nginx ] || cp -r nginx-prod nginx
  if [ ! -f "$CERT" ]; then
    cp nginx-prod/bootstrap/default.conf.template nginx/templates/default.conf.template
    $DC up -d --force-recreate nginx
  fi

  args=""
  for d in "${ready[@]}"; do args="$args -d $d"; done
  $DC --profile tools run --rm certbot certonly --webroot -w /var/www/certbot \
    $args --cert-name "$PRIMARY_DOMAIN" --expand \
    --email "$LETSENCRYPT_EMAIL" --agree-tos --no-eff-email --non-interactive

  # HTTPS configuration
  cp nginx-prod/templates/default.conf.template nginx/templates/default.conf.template
  $DC up -d --force-recreate nginx
  echo "✓ HTTPS is on for: ${ready[*]}"
else
  $DC --profile tools run --rm certbot renew --webroot -w /var/www/certbot --non-interactive
  $DC exec -T nginx nginx -s reload
  echo "✓ Certificate checked/renewed, nginx reloaded"
fi

if [ ${#skipped[@]} -gt 0 ]; then
  echo
  echo "Not covered yet: ${skipped[*]}"
  echo "  Add an A record for each (value $SERVER_IP) at your DNS provider, wait for it to spread"
  echo "  (up to an hour), then run ./sslrenew.sh again — it adds them to the certificate."
fi
$DC --profile tools run --rm certbot certificates 2>/dev/null | grep -E "Certificate Name|Domains|Expiry" || true

cd "$CUR_DIR"
