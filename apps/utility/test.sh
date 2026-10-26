#!/usr/bin/env bash
set -euo pipefail

app_dir="$(cd "$(dirname "$0")" && pwd)"
image="local/utility:test"

cd "$app_dir"

if [[ "${SKIP_BUILD:-}" != "1" ]]; then
  TAGS="$image" docker buildx bake image-local
fi

docker run --rm --entrypoint sh "$image" -c '
  ffmpeg -version >/dev/null &&
  sqlite3 --version >/dev/null &&
  test -x /usr/local/bin/sleeper &&
  test -x /usr/local/bin/longsleep
'
