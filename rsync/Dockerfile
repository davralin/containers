FROM debian:stable-20251020-slim
LABEL MAINTAINER davralin
LABEL org.opencontainers.image.source https://github.com/davralin/containers

RUN groupadd -g 1000 group && \
    useradd -m -u 1000 -g group user

RUN \
  /usr/bin/apt-get -y update && \
  /usr/bin/apt-get -y install --no-install-recommends \
    openssh-client \
    rsync \
    && \
    /bin/rm -rf /var/lib/apt/lists/*

USER user:group

RUN mkdir /home/user/.ssh
