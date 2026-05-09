FROM debian:13.4-slim@sha256:109e2c65005bf160609e4ba6acf7783752f8502ad218e298253428690b9eaa4b
LABEL MAINTAINER=davralin
LABEL org.opencontainers.image.source=https://github.com/davralin/containers

RUN groupadd -g 1000 group && \
    useradd -m -u 1000 -g group user

RUN \
  /usr/bin/apt-get -y update && \
  /usr/bin/apt-get -y install --no-install-recommends \
    openssh-client \
    rsync && \
  /usr/bin/rm -rf /var/lib/apt/lists/*

USER user:group

RUN mkdir /home/user/.ssh
