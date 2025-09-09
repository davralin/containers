FROM debian:stable-20250908-slim
LABEL MAINTAINER davralin
LABEL org.opencontainers.image.source https://github.com/davralin/containers

RUN \
  /usr/bin/apt-get -y update && \
  /usr/bin/apt-get -y install --no-install-recommends \
    borgbackup \
    borgmatic \
    openssh-client \
    && \
    /bin/rm -rf /var/lib/apt/lists/*
