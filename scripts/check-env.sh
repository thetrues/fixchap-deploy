#!/usr/bin/env bash
# Check fixchap-deploy/.env and explain anything that is wrong. Run any time:  ./scripts/check-env.sh
# (deployme.sh runs it automatically.) Exit code 1 = must fix, 0 = OK (warnings are only advice).
set -uo pipefail
cd "$(dirname "$0")/.."
. ./scripts/_env.sh
errors=0; warnings=0
err()  { echo "  ✗ $*"; errors=$((errors + 1)); }
warn() { echo "  ! $*"; warnings=$((warnings + 1)); }

echo "Checking .env"
if ! fixchap_load_env .env; then
  echo "  ✗ Fix the lines above. Format: KEY=value, one per line. Put values with spaces in quotes:"
  echo '      SERVER_NAMES="fixchap.co.tz www.fixchap.co.tz admin.fixchap.co.tz"'
  exit 1
fi

# required values
for v in APP_URL POSTGRES_DB POSTGRES_USER POSTGRES_PASSWORD AUTH_SECRET SERVER_NAMES PRIMARY_DOMAIN; do
  val="${!v:-}"
  if [ -z "$val" ]; then err "$v is empty"
  elif [ "$val" = "change-me" ]; then err "$v still says change-me"; fi
done
[ "${#AUTH_SECRET}" -ge 32 ] 2>/dev/null || err "AUTH_SECRET is too short — use: openssl rand -hex 32"
case "${APP_URL:-}" in https://*) ;; http://*) warn "APP_URL uses http:// — use https:// once SSL is set up" ;; *) err "APP_URL must start with https:// (e.g. https://fixchap.co.tz)";; esac
case " ${SERVER_NAMES:-} " in *" ${PRIMARY_DOMAIN:-} "*) ;; *) err "PRIMARY_DOMAIN ($PRIMARY_DOMAIN) must be one of SERVER_NAMES ($SERVER_NAMES)";; esac
case " ${SERVER_NAMES:-} " in *" admin.fixchap.co.tz "*) ;; *) warn "SERVER_NAMES has no admin.fixchap.co.tz — the mobile apps call https://admin.fixchap.co.tz/api";; esac
[ -n "${LETSENCRYPT_EMAIL:-}" ] || warn "LETSENCRYPT_EMAIL is empty — needed by ./sslrenew.sh"

# '$' is a variable marker for Docker Compose: in unquoted or "double-quoted" values it gets replaced
n=0
while IFS= read -r line || [ -n "$line" ]; do
  n=$((n + 1))
  case "$line" in \#*|'') continue;; esac
  key="${line%%=*}"; val="${line#*=}"
  case "$val" in \'*) continue;; esac
  if [[ "$val" == *'$'* ]]; then
    err "line $n ($key) contains \$ — Docker would change it. Wrap the value in single quotes: $key='...'"
  fi
done < .env

# things that don't stop the deploy but switch features off
[ -f secrets/credentials-file.json ] || warn "secrets/credentials-file.json missing — no push notifications"
[ -n "${SMS_USERNAME:-}" ] && [ -n "${SMS_PASSWORD:-}" ] || warn "SMS_USERNAME/SMS_PASSWORD empty — login codes will not be sent by SMS"
[ -n "${MAIL_HOST:-}" ] || warn "MAIL_HOST empty — office emails will not be sent"
[ -f dist.zip ] || warn "dist.zip missing — run packing.sh on your computer, then git pull"

# the build has the public address baked in; it should match APP_URL
if [ -f dist.zip ] && command -v unzip >/dev/null; then
  built=$(unzip -p dist.zip dist/VERSION.json 2>/dev/null | grep -o '"appUrl": *"[^"]*"' | sed 's/.*"\(http[^"]*\)"/\1/')
  if [ -n "$built" ] && [ "$built" != "${APP_URL:-}" ]; then
    warn "dist.zip was built for $built but APP_URL is $APP_URL — set APP_URL in fixchap-next/.env.production and run packing.sh again"
  fi
fi

# let Docker Compose parse it too (catches anything it disagrees with)
if command -v docker >/dev/null 2>&1; then
  if docker compose version >/dev/null 2>&1; then DC="docker compose"; else DC="docker-compose"; fi
  if ! out=$($DC config -q 2>&1); then err "Docker Compose can't read the configuration: $out"; fi
fi

if [ "$errors" -gt 0 ]; then echo "✗ $errors problem(s) in .env must be fixed ($warnings warning(s))."; exit 1; fi
echo "✓ .env looks good${warnings:+ ($warnings warning(s) above)}"
