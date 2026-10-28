# Shared helpers for the scripts in this folder (sourced, not run directly).
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

if docker compose version >/dev/null 2>&1; then DC=(docker compose)
elif command -v docker-compose >/dev/null 2>&1; then DC=(docker-compose)
else echo "Docker Compose is not installed. See README.md, step 1." >&2; exit 1; fi

load_env() {
  [ -f .env ] || { echo "Missing .env — run: cp .env.example .env  and fill it in." >&2; exit 1; }
  set -a; . ./.env; set +a
}

# psql inside the database container
psql_db() { "${DC[@]}" exec -T db psql -v ON_ERROR_STOP=1 -U "$POSTGRES_USER" -d "$POSTGRES_DB" "$@"; }

say() { printf '\n\033[1;36m==> %s\033[0m\n' "$*"; }
