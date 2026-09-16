FROM nginx:1.31.6-alpine-slim@sha256:a1a6602ca2100265744344550cab1c482f149a7a9eb7a43b38e1f5b39050a072
LABEL MAINTAINER=davralin
LABEL org.opencontainers.image.source=https://github.com/davralin/containers

RUN sed '/default_type/a \ \ \ \ server_tokens off;' -i /etc/nginx/nginx.conf
RUN sed '/server_name/a \ \ \ \ autoindex\ \ \ on;' -i /etc/nginx/conf.d/default.conf
