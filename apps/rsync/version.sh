#!/usr/bin/env bash
set -euo pipefail

docker run --rm --entrypoint dpkg-query local/rsync:test -W -f='${Version}' rsync
