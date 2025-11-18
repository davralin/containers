FROM debian:stable-20251117-slim
LABEL MAINTAINER davralin
LABEL org.opencontainers.image.source https://github.com/davralin/containers

RUN \
  /usr/bin/apt-get -y update && \
  /usr/bin/apt-get -y install --no-install-recommends \
    vdirsyncer \
    && \
    /bin/rm -rf /var/lib/apt/lists/*
