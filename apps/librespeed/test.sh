#!/usr/bin/env bash
set -euo pipefail

app_dir="$(cd "$(dirname "$0")" && pwd)"
image="local/librespeed:test"
container="librespeed-smoke-$$"

cleanup() {
  docker rm --force "$container" >/dev/null 2>&1 || true
}
trap cleanup EXIT

cd "$app_dir"

if [[ "${SKIP_BUILD:-}" != "1" ]]; then
  TAGS="$image" docker buildx bake image-local
fi

docker run --detach \
  --name "$container" \
  --read-only \
  --tmpfs /tmp:rw,noexec,nosuid,nodev,size=64m \
  --cap-drop=ALL \
  --security-opt=no-new-privileges \
  --publish 127.0.0.1::8080 \
  "$image" >/dev/null

for _ in {1..45}; do
  health="$(docker inspect --format '{{if .State.Health}}{{.State.Health.Status}}{{else}}none{{end}}' "$container")"
  case "$health" in
    healthy) break ;;
    unhealthy)
      docker logs "$container" >&2
      exit 1
      ;;
  esac
  if [[ "$(docker inspect --format '{{.State.Running}}' "$container")" != "true" ]]; then
    docker logs "$container" >&2
    exit 1
  fi
  sleep 1
done
if [[ "$health" != "healthy" ]]; then
  printf 'LibreSpeed did not become healthy within 45 seconds (last state: %s)\n' "$health" >&2
  docker inspect --format '{{json .State.Health}}' "$container" >&2
  docker logs "$container" >&2
  exit 1
fi

config="$(docker inspect --format '{{json .Config}}' "$container")"
host_config="$(docker inspect --format '{{json .HostConfig}}' "$container")"
[[ "$(jq --raw-output '.User' <<<"$config")" == "10001:10001" ]]
[[ "$(jq --raw-output '.ReadonlyRootfs' <<<"$host_config")" == "true" ]]
jq --exit-status '.CapDrop | index("ALL") != null' <<<"$host_config" >/dev/null
jq --exit-status '.SecurityOpt | any(. == "no-new-privileges")' <<<"$host_config" >/dev/null

address="$(docker port "$container" 8080/tcp)"
port="${address##*:}"
base_url="http://127.0.0.1:${port}"

page="$(curl --fail --silent --show-error "$base_url/")"
printf '%s' "$page" | grep -q 'LibreSpeed\|speedtest'
curl --fail --silent --show-error "$base_url/server-list.json" | jq --exit-status '.[0].server == "/backend"' >/dev/null

download_bytes="$(curl --fail --silent --show-error "$base_url/backend/garbage.php?ckSize=1" | wc -c)"
if [[ "$download_bytes" -ne 1048576 ]]; then
  printf 'Download endpoint returned %s bytes, expected 1048576\n' "$download_bytes" >&2
  exit 1
fi

upload_status="$(head -c 20971520 /dev/zero | curl --silent --show-error --output /dev/null --write-out '%{http_code}' --request POST --header 'Content-Type: application/octet-stream' --data-binary @- "$base_url/backend/empty.php")"
if [[ "$upload_status" != "200" ]]; then
  printf '20 MiB upload endpoint returned HTTP %s, expected 200\n' "$upload_status" >&2
  exit 1
fi

curl --fail --silent --show-error "$base_url/backend/getIP.php" >/dev/null

printf 'LibreSpeed rootless read-only smoke test passed (UID 10001, no capabilities, /tmp writable).\n'
