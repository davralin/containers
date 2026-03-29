FROM debian:13.4-slim@sha256:edc9450a9fe37d30b508808052f8d0564e3ed9eaf565e043c6f5632957f7381e
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