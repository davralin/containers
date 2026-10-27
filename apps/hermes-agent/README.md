# Hermes Agent

`hermes-agent` runs `hermes gateway run` as UID/GID `10000` without a process
supervisor. It requires writable `/opt/data` for Hermes state and `/tmp` for
temporary files; the root filesystem should be read-only.

`/usr/local/bin/hermes-gateway-healthcheck` reads the gateway heartbeat in
`$HERMES_HOME/gateway_state.json`, and functions as the image `HEALTHCHECK`.
