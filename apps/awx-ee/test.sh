#!/usr/bin/env bash
set -euo pipefail

app_dir="$(cd "$(dirname "$0")" && pwd)"
image="local/awx-ee:test"

cd "$app_dir"

if [[ "${SKIP_BUILD:-}" != "1" ]]; then
  ./generate.sh
  TAGS="$image" docker buildx bake image-local
fi

# Verify the generated execution-environment entrypoint sets a writable HOME.
docker run --rm "$image" ansible --version
docker run --rm "$image" ansible-runner --version
docker run --rm "$image" sh -ec 'command -v ssh && command -v rsync'
