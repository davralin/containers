FROM nginx:1.29.8-alpine-slim@sha256:6a9338004bea53f33e1d44a0f644ed082c3076b03747566c9535b0c724c98d09
LABEL MAINTAINER=davralin
LABEL org.opencontainers.image.source=https://github.com/davralin/containers

RUN sed '/default_type/a \ \ \ \ server_tokens off;' -i /etc/nginx/nginx.conf
RUN sed '/server_name/a \ \ \ \ autoindex\ \ \ on;' -i /etc/nginx/conf.d/default.conf
