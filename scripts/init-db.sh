#!/usr/bin/env bash
# FRESH install only: create empty FixChap tables. (Migrating from Laravel? Use migrate-from-dump.sh instead.)
. "$(dirname "$0")/_common.sh"
load_env
"${DC[@]}" up -d db
until "${DC[@]}" exec -T db pg_isready -U "$POSTGRES_USER" -d "$POSTGRES_DB" >/dev/null 2>&1; do sleep 1; done
n=$(psql_db -Atc "select count(*) from information_schema.tables where table_schema='public'")
if [ "$n" != "0" ]; then echo "The database already has $n tables — not touching it." >&2; exit 1; fi
say "Creating tables"
psql_db -q -f /database/schema.sql
echo "Done. Create a dashboard login with: scripts/create-admin.sh"
