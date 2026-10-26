#!/usr/bin/env bash
set -euo pipefail

app_dir="$(cd "$(dirname "$0")" && pwd)"
image="local/nginx-autoindex:test"
container=""
content_dir=""

cleanup() {
  if [[ -n "$container" ]]; then
    docker rm --force "$container" >/dev/null 2>&1 || true
  fi
  if [[ -n "$content_dir" ]]; then
    rm -rf "$content_dir"
  fi
}
trap cleanup EXIT

cd "$app_dir"

if [[ "${SKIP_BUILD:-}" != "1" ]]; then
  TAGS="$image" docker buildx bake image-local
fi

content_dir="$(mktemp -d)"
chmod 755 "$content_dir"
touch "$content_dir/example.txt"
container="$(docker run --detach --publish 127.0.0.1::80 --volume "$content_dir:/usr/share/nginx/html:ro" "$image")"

# The image healthcheck runs every 30 seconds; allow one probe plus startup time.
for _ in {1..45}; do
  health="$(docker inspect --format '{{if .State.Health}}{{.State.Health.Status}}{{else}}none{{end}}' "$container")"
  case "$health" in
    healthy) break ;;
    unhealthy)
      docker logs "$container"
      exit 1
      ;;
  esac
  sleep 1
done
if [[ "$health" != "healthy" ]]; then
  printf 'Container did not become healthy within 45 seconds (last state: %s)\n' "$health" >&2
  docker inspect --format '{{json .State.Health}}' "$container" >&2
  docker logs "$container" >&2
  exit 1
fi

address="$(docker port "$container" 80/tcp)"
port="${address##*:}"
body="$(curl --fail --silent --show-error "http://127.0.0.1:${port}/")"
printf '%s' "$body" | grep -q 'Index of /'
printf '%s' "$body" | grep -q 'example.txt'

if curl --fail --silent --show-error --head "http://127.0.0.1:${port}/" | grep -qi '^server: nginx/'; then
  echo "Nginx server version is exposed" >&2
  exit 1
fi
