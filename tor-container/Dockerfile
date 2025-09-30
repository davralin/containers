FROM debian:stable-20250929-slim
LABEL MAINTAINER davralin
LABEL org.opencontainers.image.source https://github.com/davralin/containers
LABEL Description="A container to contain tor"

RUN apt-get update \
    && apt-get install -y --no-install-recommends  \
    obfs4proxy      \
    socat           \
    tor             \
    tor-geoipdb     \
    torsocks        \
    && \
    rm -rf /src/* /tmp/* /var/lib/apt/lists/*

ENTRYPOINT ["/bin/su", "-l", "-s", "/bin/sh", "debian-tor", "-c", "/usr/bin/tor", "-f", "/etc/tor/torrc"]
