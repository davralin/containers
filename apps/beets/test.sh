#!/usr/bin/env bash
set -euo pipefail

app_dir="$(cd "$(dirname "$0")" && pwd)"
image="local/beets:test"

cd "$app_dir"

if [[ "${SKIP_BUILD:-}" != "1" ]]; then
  TAGS="$image" docker buildx bake image-local
fi

docker run --rm -e HOME=/tmp --entrypoint beet "$image" version
