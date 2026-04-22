FROM debian:13.4-slim@sha256:cedb1ef40439206b673ee8b33a46a03a0c9fa90bf3732f54704f99cb061d2c5a
LABEL MAINTAINER=davralin
LABEL org.opencontainers.image.source=https://github.com/davralin/containers

RUN \
  /usr/bin/apt-get -y update && \
  /usr/bin/apt-get -y install --no-install-recommends \
    ca-certificates \
    git \
    git-lfs \
    python3-pip && \
  /usr/bin/rm -rf /var/lib/apt/lists/*

RUN \
  /usr/bin/pip install --break-system-packages \
  "huggingface_hub[hf_transfer]"

RUN git config --global credential.helper store
