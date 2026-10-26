#!/usr/bin/env bash
set -euo pipefail

app_dir="$(cd "$(dirname "$0")" && pwd)"
image="local/awx-ee:test"

cd "$app_dir"

if [[ "${SKIP_BUILD:-}" != "1" ]]; then
  TAGS="$image" docker buildx bake image-local
fi

# The base execution environment runs as UID 1000 and needs a writable HOME.
docker run --rm -e HOME=/tmp --entrypoint ansible "$image" --version
