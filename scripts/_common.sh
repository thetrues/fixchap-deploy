# Shared helpers for the scripts in this folder (sourced, not run directly).
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

if docker compose version >/dev/null 2>&1; then DC=(docker compose)
elif command -v docker-compose >/dev/null 2>&1; then DC=(docker-compose)
else echo "Docker Compose is not installed. See README.md, step 1." >&2; exit 1; fi

. "$ROOT/scripts/_env.sh"
load_env() {
  fixchap_load_env .env || { echo "Fix .env first (run scripts/check-env.sh)" >&2; exit 1; }
}

# psql inside the database container
psql_db() { "${DC[@]}" exec -T db psql -v ON_ERROR_STOP=1 -U "$POSTGRES_USER" -d "$POSTGRES_DB" "$@"; }

say() { printf '\n\033[1;36m==> %s\033[0m\n' "$*"; }
