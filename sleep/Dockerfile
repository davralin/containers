FROM debian:stable-20250317-slim
LABEL MAINTAINER davralin
LABEL org.opencontainers.image.source https://github.com/davralin/containers

RUN \
  /usr/bin/apt-get -y update && \
  /usr/bin/apt-get -y install --no-install-recommends \
    ca-certificates \
    coreutils \
    file \
    git-core \
    less \
    nano \
    procps \
    rsync \
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

ENTRYPOINT    ["sh", "-c"]
CMD           ["trap : TERM INT; sleep infinity & wait"]
