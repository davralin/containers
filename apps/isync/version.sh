#!/usr/bin/env bash
set -euo pipefail

docker run --rm --entrypoint dpkg-query local/isync:test -W -f='${Version}' isync
