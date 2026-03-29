FROM debian:13.4-slim@sha256:26f98ccd92fd0a44d6928ce8ff8f4921b4d2f535bfa07555ee5d18f61429cf0c
LABEL MAINTAINER=davralin
LABEL org.opencontainers.image.source=https://github.com/davralin/containers

RUN \
  /usr/bin/apt-get -y update && \
  /usr/bin/apt-get -y install --no-install-recommends \
    coreutils && \
  /usr/bin/rm -rf /var/lib/apt/lists/* && \
  /usr/bin/echo 'alias ll="ls -l"' >> /root/.bashrc

ENTRYPOINT    ["sh", "-c"]
CMD           ["trap : TERM INT; sleep infinity & wait"]
