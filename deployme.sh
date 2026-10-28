#!/bin/bash
# Deploy FixChap on the server from dist.zip (pushed by fixchap-next/packing.sh).
#   cd /opt/deployments/fixchap-deploy && git pull && ./deployme.sh
set -e
export ENV=forprod
CUR_DIR=$(pwd)
DEPLOY_DIR="${DEPLOY_DIR:-/opt/deployments/fixchap-deploy}"
[ -d "$DEPLOY_DIR" ] || DEPLOY_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$DEPLOY_DIR"

if docker compose version >/dev/null 2>&1; then DC="docker compose"; else DC="docker-compose"; fi

# echo "Pull changes from git";

# git pull

[ -f .env ] || { echo "Missing .env — cp .env.example .env and fill it in"; exit 1; }
[ -f dist.zip ] || { echo "Missing dist.zip — run packing.sh on the development machine and git pull"; exit 1; }
set -a; . ./.env; set +a
for v in APP_URL POSTGRES_PASSWORD AUTH_SECRET SERVER_NAMES PRIMARY_DOMAIN; do
  if [ -z "${!v}" ] || [ "${!v}" = "change-me" ]; then echo "✗ $v is not set in .env"; exit 1; fi
done
[ -f secrets/credentials-file.json ] || echo "! secrets/credentials-file.json missing — push notifications will not be sent"

rm -rf __MACOSX
rm -rf dist

unzip -q dist.zip
rm -rf __MACOSX
echo "Unzipped build: $(cat dist/VERSION.json 2>/dev/null | tr -d '\n ' )"

rm -rf nginx;

cp -r nginx-prod nginx;

# No certificate yet? Serve plain HTTP until ./sslrenew.sh gets one
if [ ! -f "certbot/conf/live/$PRIMARY_DOMAIN/fullchain.pem" ]; then
  echo "! No SSL certificate for $PRIMARY_DOMAIN yet — starting nginx in HTTP-only mode. Run ./sslrenew.sh next."
  cp nginx/bootstrap/default.conf.template nginx/templates/default.conf.template
fi

# The app runs as uid 1001 in the container and must be able to write uploaded photos
for d in "${STORAGE_HOST_DIR:-./data/storage}" "${HANDYMAN_IMG_HOST_DIR:-./data/handyman_img}"; do
  mkdir -p "$d"
  if [ "$(stat -c %u "$d" 2>/dev/null || echo 1001)" != "1001" ]; then sudo chown -R 1001:1001 "$d" || chown -R 1001:1001 "$d"; fi
done
mkdir -p certbot/www certbot/conf backups

echo "Docker build";


$DC up -d --build

echo "Waiting for the app to be healthy..."
ok=0
for i in $(seq 1 60); do
  if curl -fsS "http://127.0.0.1:${APP_PORT:-3000}/api/health" >/dev/null 2>&1; then ok=1; break; fi
  sleep 2
done
if [ "$ok" = 1 ]; then
  echo "✓ FixChap is up: $APP_URL"
  $DC exec -T nginx nginx -s reload >/dev/null 2>&1 || true
  docker image prune -f >/dev/null 2>&1 || true
else
  echo "✗ The app did not become healthy. Last logs:"; $DC logs --tail 60 app; cd "$CUR_DIR"; exit 1
fi
$DC ps

cd "$CUR_DIR"

echo "End of deployment";
