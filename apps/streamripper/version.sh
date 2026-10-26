#!/usr/bin/env bash
set -euo pipefail

docker run --rm --entrypoint dpkg-query local/streamripper:test -W -f='${Version}' streamripper
