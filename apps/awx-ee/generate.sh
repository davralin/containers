#!/usr/bin/env bash
set -euo pipefail

app_dir="$(cd "$(dirname "$0")" && pwd)"
context_dir="$app_dir/.build"
# renovate: datasource=docker depName=docker.io/library/python versioning=docker
builder_image="python:3.15-slim@sha256:65a65fc7b30b06cb6df4930fd4650697cb23f4c2698ab81fc87e4b031bc36928"

rm -rf "$context_dir"

# Ansible Builder generates the build context consumed by Docker Bake below.
docker run --rm \
  --user "$(id -u):$(id -g)" \
  -e HOME=/tmp \
  -v "$app_dir:/src:Z" \
  -w /src \
  "$builder_image" \
  /bin/sh -ec '
    python -m venv /tmp/ansible-builder
    # renovate: datasource=pypi depName=ansible-builder versioning=pep440
    /tmp/ansible-builder/bin/pip install --no-cache-dir ansible-builder==3.2.0
    /tmp/ansible-builder/bin/ansible-builder create \
      --file execution-environment.yml \
      --output-filename Containerfile \
      --context .build
  '
