FROM debian:13.4-slim@sha256:4ffb3a1511099754cddc70eb1b12e50ffdb67619aa0ab6c13fcd800a78ef7c7a
LABEL MAINTAINER=davralin
LABEL org.opencontainers.image.source=https://github.com/davralin/containers

RUN groupadd -g 1000 group && \
    useradd -m -u 1000 -g group user

RUN \
  /usr/bin/apt-get -y update && \
  /usr/bin/apt-get -y install --no-install-recommends \
    openssh-client \
    rsync && \
  /usr/bin/rm -rf /var/lib/apt/lists/*

USER user:group

RUN mkdir /home/user/.ssh
