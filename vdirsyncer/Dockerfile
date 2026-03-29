FROM debian:13.3-slim@sha256:b29a157cc8540addda9836c23750e389693bf3b6d9a932a55504899e5601a66b
LABEL MAINTAINER=davralin
LABEL org.opencontainers.image.source=https://github.com/davralin/containers

RUN \
  /usr/bin/apt-get -y update && \
  /usr/bin/apt-get -y install --no-install-recommends \
    vdirsyncer && \
  /usr/bin/rm -rf /var/lib/apt/lists/*
