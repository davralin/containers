#!/bin/bash
set -e

if [ "$1" = "shell" ]; then
    exec comics shell ${*:2}
fi

if [ "$1" = "dbshell" ]; then
    exec comics dbshell ${*:2}
fi

if [ "$1" = "web" ]; then
    comics migrate
    exec gunicorn \
        --worker-tmp-dir=/dev/shm \
        --log-file=- \
        --bind=0.0.0.0:${PORT:-8000} \
        comics.wsgi \
        ${*:2}
fi

exec "$@"
