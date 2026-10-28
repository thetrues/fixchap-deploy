#!/usr/bin/env bash
# Create (or reset the password of) a dashboard user.
#   scripts/create-admin.sh <username> <email> [admin|staff]
. "$(dirname "$0")/_common.sh"
load_env
name="${1:?Usage: scripts/create-admin.sh <username> <email> [admin|staff]}"; email="${2:?email required}"; role="${3:-admin}"
read -r -s -p "Password for $name (min 8 characters): " pw; echo
[ "${#pw}" -ge 8 ] || { echo "Too short." >&2; exit 1; }
# bcrypt hash in Laravel's format, made inside the app container
hash=$(printf '%s' "$pw" | "${DC[@]}" run --rm -T --no-deps app node -e "let s='';process.stdin.on('data',d=>s+=d).on('end',()=>console.log(require('bcryptjs').hashSync(s,12).replace(/^\\\$2[ab]\\\$/,'\$2y\$')))")
is_admin=$([ "$role" = admin ] && echo 1 || echo 0)
psql_db -q -v n="$name" -v e="$email" -v h="$hash" -v a="$is_admin" -v r="$([ "$role" = admin ] && echo admin || echo user)" <<'SQL'
INSERT INTO users (name, email, password, role, is_admin, created_at, updated_at)
VALUES (:'n', :'e', :'h', :'r', CAST(:'a' AS smallint), NOW(), NOW())
ON CONFLICT (email) DO UPDATE SET name = EXCLUDED.name, password = EXCLUDED.password, role = EXCLUDED.role, is_admin = EXCLUDED.is_admin, updated_at = NOW();
SQL
echo "Dashboard user '$name' ($role) is ready. Log in at $APP_URL/login"
