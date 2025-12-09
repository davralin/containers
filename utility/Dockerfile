FROM debian:stable-20251208-slim
LABEL MAINTAINER davralin
LABEL org.opencontainers.image.source https://github.com/davralin/containers

RUN \
  /usr/bin/apt-get -y update && \
  /usr/bin/apt-get -y install --no-install-recommends \
    ca-certificates \
    calibre \
    coreutils \
    curl \
    ffmpeg \
    flac \
    file \
    git-core \
    less \
    nano \
    nmap \
    procps \
    rsync \
    shntool \
    silversearcher-ag \
    sqlite3 \
    tar \
    tmux \
    unzip \
    vim \
    wget \
    && \
    /bin/rm -rf /var/lib/apt/lists/* \
    /bin/echo 'alias ll="ls -l"' >> /root/.bashrc

ADD sleeper.sh /usr/local/bin/sleeper

ENTRYPOINT    ["sh", "-c"]
CMD           ["trap : TERM INT; sleep infinity & wait"]
