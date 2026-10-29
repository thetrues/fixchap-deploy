# Safe .env reader for the FixChap server scripts (sourced, not run).
# Reads KEY=value lines as plain data — like Docker Compose does — instead of running the file as bash,
# so values with spaces, & ; ( ) ! or quotes don't break anything.

# fixchap_load_env [file]  -> exports every KEY=value; returns 1 (with line numbers) if a line is invalid
fixchap_load_env() {
  local file="${1:-.env}" n=0 line key val bad=0 tmp
  local re_kv='^[[:space:]]*(export[[:space:]]+)?([A-Za-z_][A-Za-z0-9_]*)[[:space:]]*=[[:space:]]*(.*)$'
  local re_dq='^"(.*)"[[:space:]]*(#.*)?$'
  local re_sq="^'(.*)'[[:space:]]*(#.*)?\$"
  local re_skip='^[[:space:]]*(#.*)?$'

  if [ ! -f "$file" ]; then
    echo "✗ $file not found (it is not in git). Create it on the server:" >&2
    echo "    cp .env.example .env && nano .env" >&2
    return 1
  fi
  # Windows line endings (CRLF) break bash and docker; fix them in place
  if grep -q $'\r' "$file"; then
    tmp=$(mktemp) && tr -d '\r' < "$file" > "$tmp" && cat "$tmp" > "$file" && rm -f "$tmp"
    echo "  (fixed Windows line endings in $file)" >&2
  fi

  while IFS= read -r line || [ -n "$line" ]; do
    n=$((n + 1))
    [[ "$line" =~ $re_skip ]] && continue
    if [[ ! "$line" =~ $re_kv ]]; then
      echo "✗ $file line $n is not KEY=value: ${line:0:70}" >&2; bad=1; continue
    fi
    key="${BASH_REMATCH[2]}"; val="${BASH_REMATCH[3]}"
    if [[ "$val" =~ $re_dq ]]; then
      val="${BASH_REMATCH[1]}"
    elif [[ "$val" =~ $re_sq ]]; then
      val="${BASH_REMATCH[1]}"
    elif [[ "$val" == \"* || "$val" == \'* ]]; then
      echo "✗ $file line $n: $key starts with a quote but has no closing quote" >&2; bad=1; continue
    else
      val="${val%%[[:space:]]#*}"                 # inline comment: VALUE  # note
      val="${val%"${val##*[![:space:]]}"}"        # trailing spaces
    fi
    export "$key=$val"
  done < "$file"
  return $bad
}
