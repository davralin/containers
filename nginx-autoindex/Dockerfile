FROM nginx:1.31.8-alpine-slim@sha256:296bb9f2b5a6e69c2192a14b802cb6acc89c2a1d0dd46dfe266b06e49c0b8df4
LABEL MAINTAINER=davralin
LABEL org.opencontainers.image.source=https://github.com/davralin/containers

RUN sed '/default_type/a \ \ \ \ server_tokens off;' -i /etc/nginx/nginx.conf
RUN sed '/server_name/a \ \ \ \ autoindex\ \ \ on;' -i /etc/nginx/conf.d/default.conf
