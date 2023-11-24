FROM debian:stable-20231030-slim
LABEL MAINTAINER davralin

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
