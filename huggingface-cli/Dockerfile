FROM debian:13.6-slim@sha256:3a39a0592364683e6bab97937b72cad5a8fa6dcbbee90edb3bb48c7f8e94f258
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
