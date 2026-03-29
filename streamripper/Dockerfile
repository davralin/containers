FROM debian:stable-20260316-slim@sha256:10e919a6b4e40784765d8438813d46b25ca76caa354fab9fbb86becbc66d7c27
LABEL MAINTAINER=davralin
LABEL org.opencontainers.image.source=https://github.com/davralin/containers

RUN \
  /usr/bin/apt-get -y update && \
  /usr/bin/apt-get -y install --no-install-recommends \
    ffmpeg \
    streamripper && \
  /usr/bin/rm -rf /var/lib/apt/lists/*