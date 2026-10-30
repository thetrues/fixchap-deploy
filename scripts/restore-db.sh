#!/usr/bin/env bash
# Restore a backup made by backup-db.sh. REPLACES the current data.
#   scripts/restore-db.sh backups/fixchap-20261028-020000-daily.dump
. "$(dirname "$0")/_common.sh"
load_env
f="${1:?Usage: scripts/restore-db.sh backups/<file>.dump}"
[ -f "$f" ] || { echo "Not found: $f" >&2; exit 1; }
read -r -p "Replace the current database with $f? Type YES: " ok; case "$ok" in [Yy][Ee][Ss]) ;; *) echo "Cancelled — nothing was changed."; exit 1;; esac
"${DC[@]}" stop app
"${DC[@]}" exec -T db pg_restore -U "$POSTGRES_USER" -d "$POSTGRES_DB" --clean --if-exists --no-owner < "$f"
"${DC[@]}" up -d app
echo "Restored $f"
