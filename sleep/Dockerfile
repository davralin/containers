FROM debian:13.5-slim@sha256:f3da28155e2e26086464eba22cd235b22200b7143e8f3e1811bf359e3114bf96
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
