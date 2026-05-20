FROM debian:13.5-slim@sha256:b6e2a152f22a40ff69d92cb397223c906017e1391a73c952b588e51af8883bf8
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
