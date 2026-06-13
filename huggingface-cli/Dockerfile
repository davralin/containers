FROM debian:13.5-slim@sha256:4e401d95de7083948053197a9c3913343cd06b706bf15eb6a0c3ccd26f436a0e
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
