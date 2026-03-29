FROM debian:13.4-slim@sha256:26f98ccd92fd0a44d6928ce8ff8f4921b4d2f535bfa07555ee5d18f61429cf0c
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
