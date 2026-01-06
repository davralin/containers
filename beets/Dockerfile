FROM debian:stable-20251229-slim
LABEL MAINTAINER=davralin
LABEL org.opencontainers.image.source=https://github.com/davralin/containers

RUN \
  /usr/bin/apt-get -y update && \
  /usr/bin/apt-get -y install --no-install-recommends \
    ca-certificates \
    git \
    git-lfs \
    ffmpeg \
    imagemagick \
    python3-dev \
    python3-pip \
    tmux \
    vim && \
  /usr/bin/rm -rf /var/lib/apt/lists/*

# I use tmux to run longer jobs in k8s on unstable laptop-connections

RUN \
  /usr/bin/pip install --break-system-packages \
  "beets[badfiles,embedart,fetchart,ftintitle,inline,lastgenre,scrub,discogs]"

USER 1000

ENTRYPOINT    ["sh", "-c"]
CMD           ["trap : TERM INT; sleep infinity & wait"]
