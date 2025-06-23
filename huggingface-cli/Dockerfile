FROM debian:stable-20250520-slim
LABEL MAINTAINER davralin
LABEL org.opencontainers.image.source https://github.com/davralin/containers

RUN \
  /usr/bin/apt-get -y update && \
  /usr/bin/apt-get -y install --no-install-recommends \
    ca-certificates \
    git \
    git-lfs \
    python3-pip

RUN \
  /usr/bin/pip install --break-system-packages \
  "huggingface_hub[hf_transfer]"

RUN git config --global credential.helper store
