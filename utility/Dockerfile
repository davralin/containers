FROM debian:stable-20260202-slim
LABEL MAINTAINER=davralin
LABEL org.opencontainers.image.source=https://github.com/davralin/containers

RUN \
  /usr/bin/apt-get -y update && \
  /usr/bin/apt-get -y install --no-install-recommends \
    ca-certificates \
    calibre \
    coreutils \
    curl \
    e2fsprogs \
    ffmpeg \
    flac \
    file \
    git-core \
    less \
    nano \
    nmap \
    procps \
    rename \
    rsync \
    shntool \
    silversearcher-ag \
    sqlite3 \
    tar \
    tmux \
    unzip \
    vim \
    wget && \
  /usr/bin/rm -rf /var/lib/apt/lists/*

ADD sleeper /usr/local/bin/sleeper
ADD longsleep /usr/local/bin/longsleep

ENTRYPOINT    ["sh", "-c"]
CMD           ["trap : TERM INT; sleep infinity & wait"]
