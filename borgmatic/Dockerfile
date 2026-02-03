FROM debian:stable-20260202-slim
LABEL MAINTAINER=davralin
LABEL org.opencontainers.image.source=https://github.com/davralin/containers

RUN \
  /usr/bin/apt-get -y update && \
  /usr/bin/apt-get -y install --no-install-recommends \
    borgbackup \
    borgmatic \
    openssh-client && \
  /usr/bin/rm -rf /var/lib/apt/lists/*