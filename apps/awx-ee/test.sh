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

ansible_posix="$(docker run --rm "$image" ansible-galaxy collection list ansible.posix)"
community_general="$(docker run --rm "$image" ansible-galaxy collection list community.general)"
[[ "$ansible_posix" == *"ansible.posix 2.1.0"* ]]
[[ "$community_general" == *"community.general 10.7.9"* ]]
rm -rf ./build
