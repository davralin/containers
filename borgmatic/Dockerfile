FROM debian:stable-20231030-slim
LABEL MAINTAINER davralin

RUN \
  /usr/bin/apt-get -y update && \
  /usr/bin/apt-get -y install --no-install-recommends \
    borgbackup \
    borgmatic \
    openssh-client \
    && \
    /bin/rm -rf /var/lib/apt/lists/*
