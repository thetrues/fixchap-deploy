#!/bin/bash
# Let's Encrypt certificate for FixChap.
#  - first run: gets the certificate for every name in SERVER_NAMES and switches nginx to HTTPS
#  - later runs: renews it if it expires within 30 days, then reloads nginx
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

echo "$(date '+%F %T') SSL check for: $SERVER_NAMES"

if [ ! -f "certbot/conf/live/$PRIMARY_DOMAIN/fullchain.pem" ]; then
  echo "No certificate yet — requesting one"
  # nginx must answer the Let's Encrypt check over plain HTTP
  if [ ! -d nginx ]; then cp -r nginx-prod nginx; fi
  cp nginx-prod/bootstrap/default.conf.template nginx/templates/default.conf.template
  $DC up -d --force-recreate nginx

  domains=""
  for d in $SERVER_NAMES; do domains="$domains -d $d"; done
  $DC --profile tools run --rm certbot certonly --webroot -w /var/www/certbot \
    $domains --cert-name "$PRIMARY_DOMAIN" \
    --email "$LETSENCRYPT_EMAIL" --agree-tos --no-eff-email --non-interactive

  # switch nginx to the HTTPS configuration
  cp nginx-prod/templates/default.conf.template nginx/templates/default.conf.template
  $DC up -d --force-recreate nginx
  echo "✓ HTTPS is on for: $SERVER_NAMES"
else
  $DC --profile tools run --rm certbot renew --webroot -w /var/www/certbot --non-interactive
  $DC exec -T nginx nginx -s reload
  echo "✓ Certificate checked/renewed, nginx reloaded"
fi
$DC --profile tools run --rm certbot certificates 2>/dev/null | grep -E "Certificate Name|Domains|Expiry" || true

cd "$CUR_DIR"
