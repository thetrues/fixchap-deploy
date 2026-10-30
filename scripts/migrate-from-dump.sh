#!/usr/bin/env bash
# Copy the Laravel MySQL data into PostgreSQL.
#   scripts/migrate-from-dump.sh /path/to/fixchap.sql
# Steps: loads the dump into a temporary MariaDB container, copies everything into Postgres with pgloader,
# then compares row counts table by table. The FixChap tables in Postgres are REPLACED.
. "$(dirname "$0")/_common.sh"
load_env
DUMP="${1:-}"
if [ -z "$DUMP" ]; then
  echo "Which MySQL dump should be imported? Give its path, for example:"
  echo "    ./scripts/migrate-from-dump.sh backups/fixchap.sql"
  echo
  echo "Copy the dump to the server first (from your computer):"
  echo "    scp fixchap.sql root@<server-ip>:$ROOT/backups/"
  found=$(find "$ROOT" "$ROOT/backups" /root /tmp /home -maxdepth 2 -name '*.sql' 2>/dev/null | sort -u | head -10)
  if [ -n "$found" ]; then echo; echo ".sql files found on this server:"; echo "$found" | sed 's/^/    /'; fi
  exit 1
fi
# a relative path is relative to the folder the script was started from
if [[ "$DUMP" != /* ]] && [ ! -f "$DUMP" ] && [ -n "${OLDPWD:-}" ] && [ -f "$OLDPWD/$DUMP" ]; then DUMP="$OLDPWD/$DUMP"; fi
[ -f "$DUMP" ] || { echo "File not found: $DUMP" >&2; exit 1; }
MPW="${MIGRATE_MYSQL_PASSWORD:-fixchap-temp-only}"

echo "This replaces the FixChap tables in the '$POSTGRES_DB' database with the data from $DUMP."
read -r -p "Type YES to continue: " ok; case "$ok" in [Yy][Ee][Ss]) ;; *) echo "Cancelled — nothing was changed."; exit 1;; esac

say "Backing up the current Postgres database first"
"${DC[@]}" up -d db
until "${DC[@]}" exec -T db pg_isready -U "$POSTGRES_USER" -d "$POSTGRES_DB" >/dev/null 2>&1; do sleep 1; done
"$ROOT/scripts/backup-db.sh" pre-migration

say "Stopping the app during the copy"
"${DC[@]}" stop app 2>/dev/null || true
# If anything below fails: remove the temporary MariaDB and start the app again
cleanup() {
  rm -f "$ROOT/database/.run.load"
  "${DC[@]}" --profile migrate rm -sf mysql-temp >/dev/null 2>&1 || true
  "${DC[@]}" up -d app >/dev/null 2>&1 || true
}
trap 'echo; echo "✗ Migration stopped — the app was started again with the old data." >&2; cleanup' ERR

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
# pgloader does not decode %xx in its URLs, so the Postgres password is passed in PGPASSWORD
# (read by pgloader when the URL has none). In the MySQL URL a literal @ is written as @@.
MPW_URL="${MPW//@/@@}"
sed -e "s#^  FROM mysql://.*#  FROM mysql://root:${MPW_URL//#/\\#}@mysql-temp:3306/fixchap#" \
    -e "s#^  INTO postgresql://.*#  INTO postgresql://$POSTGRES_USER@db:5432/$POSTGRES_DB#" \
    database/mysql-to-postgres.load.example > database/.run.load
chmod 600 database/.run.load
export PGPASSWORD="$POSTGRES_PASSWORD"
"${DC[@]}" --profile migrate run --rm -e PGPASSWORD pgloader pgloader --no-ssl-cert-verification /database/.run.load | tail -45
unset PGPASSWORD
rm -f database/.run.load

say "Applying database updates (new tables and columns)"
for f in database/migrations/*.sql; do
  [ -e "$f" ] || continue
  "${DC[@]}" exec -T -e PGOPTIONS=--client-min-messages=warning db psql -q -v ON_ERROR_STOP=1 -U "$POSTGRES_USER" -d "$POSTGRES_DB" -f "/$f"
done

say "Comparing row counts"
skip=" failed_jobs jobs job_batches sessions migrations cache cache_locks password_reset_tokens personal_access_tokens "
bad=0
while read -r t; do
  case "$skip" in *" $t "*) continue;; esac
  m=$("${DC[@]}" --profile migrate exec -T mysql-temp mariadb -uroot -p"$MPW" -N fixchap -e "SELECT COUNT(*) FROM \`$t\`")
  p=$(psql_db -Atc "SELECT COUNT(*) FROM \"$t\"" 2>/dev/null || echo "missing")
  if [ "$m" = "$p" ]; then printf "  ✓ %-30s %s\n" "$t" "$m"; else printf "  ✗ %-30s mysql=%s postgres=%s\n" "$t" "$m" "$p"; bad=1; fi
done < <("${DC[@]}" --profile migrate exec -T mysql-temp mariadb -uroot -p"$MPW" -N fixchap -e "SHOW TABLES")

trap - ERR
say "Removing the temporary MariaDB"
"${DC[@]}" --profile migrate rm -sf mysql-temp >/dev/null

say "Starting the app"
"${DC[@]}" up -d app
if [ "$bad" = 0 ]; then echo "Migration complete — every table matches."; else echo "Some tables differ — check above before going live." >&2; exit 1; fi
