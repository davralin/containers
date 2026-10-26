#!/usr/bin/env bash
set -euo pipefail

docker run --rm --entrypoint dpkg-query local/borgmatic:test -W -f='${Version}' borgmatic
