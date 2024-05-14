FROM debian:stable-20240513-slim
LABEL MAINTAINER davralin
LABEL org.opencontainers.image.source https://github.com/davralin/containers

RUN \
  /usr/bin/apt-get -y update && \
  /usr/bin/apt-get -y install --no-install-recommends \
    adb \
    fastboot \
    heimdall-flash \
    wget \
    && \
    /bin/rm -rf /var/lib/apt/lists/*

ENTRYPOINT    ["sh", "-c"]
CMD           ["trap : TERM INT; sleep infinity & wait"]
