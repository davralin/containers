#!/usr/bin/env bash
set -euo pipefail

docker run --rm --entrypoint python3 local/beets:test -c 'from importlib.metadata import version; print(version("beets"))'
