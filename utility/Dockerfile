FROM debian:13.4-slim@sha256:edc9450a9fe37d30b508808052f8d0564e3ed9eaf565e043c6f5632957f7381e
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
