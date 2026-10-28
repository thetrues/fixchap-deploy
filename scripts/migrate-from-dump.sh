#!/usr/bin/env bash
# Copy the Laravel MySQL data into PostgreSQL.
#   scripts/migrate-from-dump.sh /path/to/fixchap.sql
# Steps: loads the dump into a temporary MariaDB container, copies everything into Postgres with pgloader,
# then compares row counts table by table. The FixChap tables in Postgres are REPLACED.
. "$(dirname "$0")/_common.sh"
load_env
DUMP="${1:?Usage: scripts/migrate-from-dump.sh /path/to/fixchap.sql}"
[ -f "$DUMP" ] || { echo "File not found: $DUMP" >&2; exit 1; }
MPW="${MIGRATE_MYSQL_PASSWORD:-fixchap-temp-only}"
urlenc() { python3 -c 'import sys,urllib.parse;print(urllib.parse.quote(sys.argv[1],safe=""))' "$1"; }

echo "This replaces the FixChap tables in the '$POSTGRES_DB' database with the data from $DUMP."
read -r -p "Type YES to continue: " ok; [ "$ok" = "YES" ] || exit 1

say "Backing up the current Postgres database first"
"${DC[@]}" up -d db
until "${DC[@]}" exec -T db pg_isready -U "$POSTGRES_USER" -d "$POSTGRES_DB" >/dev/null 2>&1; do sleep 1; done
"$ROOT/scripts/backup-db.sh" pre-migration

say "Stopping the app during the copy"
"${DC[@]}" stop app 2>/dev/null || true

say "Loading the dump into a temporary MariaDB"
"${DC[@]}" --profile migrate up -d mysql-temp
for i in $(seq 1 90); do
  [ "$("${DC[@]}" --profile migrate ps --format '{{.Health}}' mysql-temp 2>/dev/null)" = "healthy" ] && break
  [ "$i" = 90 ] && { echo "MariaDB did not start. Logs:"; "${DC[@]}" --profile migrate logs --tail 30 mysql-temp; exit 1; }
  sleep 2
done
"${DC[@]}" --profile migrate exec -T mysql-temp mariadb -uroot -p"$MPW" -e "DROP DATABASE IF EXISTS fixchap; CREATE DATABASE fixchap CHARACTER SET utf8mb4;"
"${DC[@]}" --profile migrate exec -T mysql-temp mariadb -uroot -p"$MPW" fixchap < "$DUMP"

say "Copying into PostgreSQL with pgloader"
sed -e "s#^  FROM mysql://.*#  FROM mysql://root:$(urlenc "$MPW")@mysql-temp:3306/fixchap#" \
    -e "s#^  INTO postgresql://.*#  INTO postgresql://$(urlenc "$POSTGRES_USER"):$(urlenc "$POSTGRES_PASSWORD")@db:5432/$(urlenc "$POSTGRES_DB")#" \
    database/mysql-to-postgres.load.example > database/.run.load
chmod 600 database/.run.load
"${DC[@]}" --profile migrate run --rm pgloader pgloader --no-ssl-cert-verification /database/.run.load | tail -45
rm -f database/.run.load

say "Comparing row counts"
skip=" failed_jobs jobs job_batches sessions migrations cache cache_locks password_reset_tokens personal_access_tokens "
bad=0
while read -r t; do
  case "$skip" in *" $t "*) continue;; esac
  m=$("${DC[@]}" --profile migrate exec -T mysql-temp mariadb -uroot -p"$MPW" -N fixchap -e "SELECT COUNT(*) FROM \`$t\`")
  p=$(psql_db -Atc "SELECT COUNT(*) FROM \"$t\"" 2>/dev/null || echo "missing")
  if [ "$m" = "$p" ]; then printf "  ✓ %-30s %s\n" "$t" "$m"; else printf "  ✗ %-30s mysql=%s postgres=%s\n" "$t" "$m" "$p"; bad=1; fi
done < <("${DC[@]}" --profile migrate exec -T mysql-temp mariadb -uroot -p"$MPW" -N fixchap -e "SHOW TABLES")

say "Removing the temporary MariaDB"
"${DC[@]}" --profile migrate rm -sf mysql-temp >/dev/null

say "Starting the app"
"${DC[@]}" up -d app
if [ "$bad" = 0 ]; then echo "Migration complete — every table matches."; else echo "Some tables differ — check above before going live." >&2; exit 1; fi
