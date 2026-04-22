FROM debian:13.4-slim@sha256:cedb1ef40439206b673ee8b33a46a03a0c9fa90bf3732f54704f99cb061d2c5a
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
    jq \
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
