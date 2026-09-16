FROM nginx:1.31.6-alpine-slim@sha256:1a736dc58a4e729c50ad03bb262e766fabbb71b0bfc4c9861fae5f84fd85d9b6
LABEL MAINTAINER=davralin
LABEL org.opencontainers.image.source=https://github.com/davralin/containers

RUN sed '/default_type/a \ \ \ \ server_tokens off;' -i /etc/nginx/nginx.conf
RUN sed '/server_name/a \ \ \ \ autoindex\ \ \ on;' -i /etc/nginx/conf.d/default.conf
