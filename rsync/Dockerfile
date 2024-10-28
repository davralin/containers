FROM debian:stable-20241016-slim
LABEL MAINTAINER davralin
LABEL org.opencontainers.image.source https://github.com/davralin/containers

RUN \
  /usr/bin/apt-get -y update && \
  /usr/bin/apt-get -y install --no-install-recommends \
    openssh-client \
    rsync \
    && \
    /bin/rm -rf /var/lib/apt/lists/*

USER 1000