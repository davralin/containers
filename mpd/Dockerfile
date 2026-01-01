FROM debian:stable-20251117-slim
LABEL MAINTAINER davralin
LABEL org.opencontainers.image.source https://github.com/davralin/containers

RUN \
  /usr/bin/apt-get -y update && \
  /usr/bin/apt-get -y install --no-install-recommends \
    mpc \
    mpd \
    ncmpcpp && \
  /usr/bin/rm -rf /var/lib/apt/lists/*

ADD mpd.conf /etc/mpd.conf

RUN \
  /usr/bin/touch /var/lib/mpd/tag_cache /var/lib/mpd/state && \
  /usr/bin/chown -R mpd:audio /var/lib/mpd

USER 100

VOLUME /var/lib/mpd
WORKDIR /var/lib/mpd
EXPOSE 6600 8000

ENTRYPOINT    ["/usr/bin/mpd", "--no-daemon", "/etc/mpd.conf"]