FROM debian:stable-20231030-slim
LABEL MAINTAINER davralin

RUN \
  /usr/bin/apt-get -y update && \
  /usr/bin/apt-get -y install --no-install-recommends \
    coreutils \
    git-core \
    less \
    nano \
    procps \
    rsync \
    silversearcher-ag \
    sqlite3 \
    tar \
    unzip \
    vim \
    && \
    /bin/rm -rf /var/lib/apt/lists/* \
    /bin/echo 'alias ll="ls -l"' >> /etc/profile

ENTRYPOINT    ["sh", "-c"]
CMD           ["trap : TERM INT; sleep infinity & wait"]
