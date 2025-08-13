FROM debian:stable-20250811-slim
LABEL MAINTAINER davralin
LABEL org.opencontainers.image.source https://github.com/davralin/containers

RUN \
  /usr/bin/apt-get -y update && \
  /usr/bin/apt-get -y install --no-install-recommends \
    python3-pip \
    unzip \
    vim \
    && \
    /bin/rm -rf /var/lib/apt/lists/* \
    && \
    /usr/bin/pip3 install --break-system-packages instaloader
