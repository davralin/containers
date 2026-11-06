#!/usr/bin/env bash
set -euo pipefail

app_dir="$(cd "$(dirname "$0")" && pwd)"
image="local/mpd:test"
container="mpd-smoke-$$"

cleanup() {
  docker rm --force "$container" >/dev/null 2>&1 || true
}
trap cleanup EXIT

cd "$app_dir"

if [[ "${SKIP_BUILD:-}" != "1" ]]; then
  TAGS="$image" docker buildx bake image-local
fi

docker run --rm --entrypoint mpd "$image" --version

docker run --detach --name "$container" "$image" >/dev/null
for _ in {1..30}; do
  if docker exec "$container" mpc status >/dev/null 2>&1; then
    exit 0
  fi
  if [[ "$(docker inspect --format '{{.State.Running}}' "$container")" != "true" ]]; then
    docker logs "$container" >&2
    exit 1
  fi
  sleep 1
done

printf 'MPD did not accept a client connection within 30 seconds\n' >&2
docker logs "$container" >&2
exit 1
