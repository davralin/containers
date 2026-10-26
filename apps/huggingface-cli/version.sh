#!/usr/bin/env bash
set -euo pipefail

docker run --rm --entrypoint python3 local/huggingface-cli:test -c 'from importlib.metadata import version; print(version("huggingface_hub"))'
