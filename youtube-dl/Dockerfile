FROM debian:stable-20240701-slim
LABEL MAINTAINER davralin
LABEL org.opencontainers.image.source https://github.com/davralin/containers

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
    python3-minimal \
    python3-mutagen \
    python-is-python3 \
    rename \
    webp \
    && \
    /bin/rm -rf /var/lib/apt/lists/* && \
    /bin/mkdir -p /output && \
    /usr/bin/curl -L --create-dirs --output /usr/local/bin/youtube-dl "https://yt-dl.org/downloads/latest/youtube-dl" && \
    /bin/chmod 0755 /usr/local/bin/youtube-dl && \
    /usr/bin/curl -L --create-dirs --output /usr/local/bin/yt-dlp "https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp" && \
    /bin/chmod 0755 /usr/local/bin/yt-dlp

WORKDIR /output
ENTRYPOINT /usr/local/bin/yt-dlp
