FROM debian:13.6-slim@sha256:020c0d20b9880058cbe785a9db107156c3c75c2ac944a6aa7ab59f2add76a7bd
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
    python3 \
    python3-minimal \
    python3-mutagen \
    python3-pip \
    python-is-python3 \
    rename \
    unzip \
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
  "yt-dlp-ejs" \
  "curl_cffi"

RUN \
  curl -fsSL https://deno.land/install.sh | DENO_INSTALL=/usr/local sh

WORKDIR /output

USER 1000
ENV HOME=/tmp
