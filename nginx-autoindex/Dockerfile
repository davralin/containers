FROM nginx:1.30.0-alpine-slim@sha256:830b40ff1beb5e018e56aef2ed1f9fe87a7797e35a555b75fea5c9568e316b04
LABEL MAINTAINER=davralin
LABEL org.opencontainers.image.source=https://github.com/davralin/containers

RUN sed '/default_type/a \ \ \ \ server_tokens off;' -i /etc/nginx/nginx.conf
RUN sed '/server_name/a \ \ \ \ autoindex\ \ \ on;' -i /etc/nginx/conf.d/default.conf
