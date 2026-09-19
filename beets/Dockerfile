FROM debian:13.7-slim@sha256:93b9a6764e5d7a53b6b3682cc370cbb85ace510ffe5f60b6a03821655a4b3e52
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
