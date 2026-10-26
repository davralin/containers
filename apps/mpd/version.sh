#!/usr/bin/env bash
set -euo pipefail

docker run --rm --entrypoint dpkg-query local/mpd:test -W -f='${Version}' mpd
