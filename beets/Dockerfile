FROM debian:stable-20250610-slim
LABEL MAINTAINER davralin
LABEL org.opencontainers.image.source https://github.com/davralin/containers

RUN \
  /usr/bin/apt-get -y update && \
  /usr/bin/apt-get -y install --no-install-recommends \
    ca-certificates \
    git \
    git-lfs \
    ffmpeg \
    python3-dev \
    python3-pip \
    tmux # Nice to detach the container

RUN \
  /usr/bin/pip install --break-system-packages \
  "beets[badfiles,embedart,fetchart,FtInTitle,inline,lastgenre,scrub]"

USER 1000

ENTRYPOINT    ["sh", "-c"]
CMD           ["trap : TERM INT; sleep infinity & wait"]
