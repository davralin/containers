FROM debian:stable-20250203-slim
LABEL MAINTAINER davralin
LABEL org.opencontainers.image.source https://github.com/davralin/containers

RUN \
  /usr/bin/apt-get -y update && \
  /usr/bin/apt-get -y install --no-install-recommends \
    python3-pip \
    git-core \
    less \
    nano \
    procps \
    rsync \
    silversearcher-ag \
    tar \
    unzip \
    vim \
    && \
    /bin/rm -rf /var/lib/apt/lists/* \
    && \
    /usr/bin/pip3 install --break-system-packages python-binance
