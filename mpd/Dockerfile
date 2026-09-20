FROM debian:13.7-slim@sha256:a99cfc517144bc59b1978475ec53b46ecabec7e43635402ee5b77cc54cd1b20a
LABEL MAINTAINER=davralin
LABEL org.opencontainers.image.source=https://github.com/davralin/containers

RUN \
  /usr/bin/apt-get -y update && \
  /usr/bin/apt-get -y install --no-install-recommends \
    mpc \
    mpd && \
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