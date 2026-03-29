FROM debian:13.4-slim@sha256:26f98ccd92fd0a44d6928ce8ff8f4921b4d2f535bfa07555ee5d18f61429cf0c
LABEL MAINTAINER=davralin
LABEL org.opencontainers.image.source=https://github.com/davralin/containers

RUN \
  /usr/bin/apt-get -y update && \
  /usr/bin/apt-get -y install --no-install-recommends \
    atomicparsley \
    attr \
    ca-certificates \
    coreutils \
    curl \
    ffmpeg \
    jq \
    mkvtoolnix \
    python3-dev \
    python3-minimal \
    python3-mutagen \
    python3-pip \
    python-is-python3 \
    rename \
    webp \
    && \
    /bin/rm -rf /var/lib/apt/lists/* && \
    /bin/mkdir -p /output && \
    /usr/bin/curl -L --create-dirs --output /usr/local/bin/yt-dlp "https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp" && \
    /bin/chmod 0755 /usr/local/bin/yt-dlp

RUN \
  /usr/bin/pip install --break-system-packages \
  "spotdl" && \
  /usr/bin/ln -s /output/ /.config

RUN \
  /usr/bin/pip install --break-system-packages \
  "yt-dlp-ejs"

WORKDIR /output

USER 1000
ENV HOME=/tmp
