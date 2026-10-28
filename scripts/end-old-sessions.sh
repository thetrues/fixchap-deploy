#!/usr/bin/env bash
# Log out every app session created by the old Laravel API (their codes were guessable).
# Run once after migrating; app users simply log in again with an SMS code.
. "$(dirname "$0")/_common.sh"
load_env
n=$(psql_db -Atc "UPDATE \"session\" SET status_id = 6 WHERE status_id = 1 AND length(session_code) <> 48 RETURNING 1" | wc -l | tr -d ' ')
echo "Ended $n old app sessions."
