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

[ -f dist.zip ] || { echo "Missing dist.zip — run packing.sh on the development machine and git pull"; exit 1; }
# check .env and stop with a clear message if anything is wrong
./scripts/check-env.sh || exit 1
. ./scripts/_env.sh
fixchap_load_env .env

rm -rf __MACOSX
rm -rf dist

# unzip if installed, otherwise Python's built-in zip support (apt install -y unzip to add it)
if command -v unzip >/dev/null 2>&1; then
  unzip -q dist.zip
elif command -v python3 >/dev/null 2>&1; then
  python3 -m zipfile -e dist.zip .
else
  echo "✗ Can't unzip dist.zip: install unzip with  apt install -y unzip"; exit 1
fi
[ -f dist/server.js ] || { echo "✗ dist.zip did not contain dist/server.js — rebuild with packing.sh"; exit 1; }
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

# Database changes (new tables etc.). Each file in database/migrations is safe to run again.
if ls database/migrations/*.sql >/dev/null 2>&1; then
  echo "Database updates";
  $DC up -d db
  until $DC exec -T db pg_isready -U "$POSTGRES_USER" -d "$POSTGRES_DB" >/dev/null 2>&1; do sleep 1; done
  for f in database/migrations/*.sql; do
    echo "  $f"
    $DC exec -T -e PGOPTIONS=--client-min-messages=warning db psql -q -v ON_ERROR_STOP=1 -U "$POSTGRES_USER" -d "$POSTGRES_DB" -f "/$f" \
      || { echo "✗ $f failed — deployment stopped, nothing else changed."; exit 1; }
  done
fi

echo "Docker build";


$DC up -d --build

echo "Waiting for the app to be healthy..."
ok=0
for i in $(seq 1 60); do
  if command -v curl >/dev/null 2>&1; then
    curl -fsS "http://127.0.0.1:${APP_PORT:-3000}/api/health" >/dev/null 2>&1 && { ok=1; break; }
  else
    $DC exec -T app wget -qO- http://127.0.0.1:3000/api/health >/dev/null 2>&1 && { ok=1; break; }
  fi
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
