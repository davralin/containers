FROM debian:13.5-slim@sha256:f3da28155e2e26086464eba22cd235b22200b7143e8f3e1811bf359e3114bf96
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