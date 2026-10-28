#!/usr/bin/env bash
# Back up the database to ./backups (keeps the newest 14). Good to run daily from cron:
#   0 2 * * * /path/to/fixchap-deploy/scripts/backup-db.sh >> /path/to/fixchap-deploy/backups/backup.log 2>&1
. "$(dirname "$0")/_common.sh"
load_env
tag="${1:-daily}"
file="backups/fixchap-$(date +%Y%m%d-%H%M%S)-$tag.dump"
"${DC[@]}" exec -T db pg_dump -U "$POSTGRES_USER" -d "$POSTGRES_DB" -Fc > "$file"
echo "Backup written: $file ($(du -h "$file" | cut -f1))"
ls -1t backups/fixchap-*.dump 2>/dev/null | tail -n +15 | xargs -r rm -f
