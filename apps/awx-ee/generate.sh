#!/usr/bin/env bash
set -euo pipefail

app_dir="$(cd "$(dirname "$0")" && pwd)"
context_dir="$app_dir/.build"
# renovate: datasource=docker depName=docker.io/library/python versioning=docker
builder_image="python:3.15-slim@sha256:63bb298d2b7b88f176f51b5189f54ce6535c997682ea70885d2132f5d473a8a5"

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
