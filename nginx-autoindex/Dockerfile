FROM nginx:1.31.2-alpine-slim@sha256:eb37f58646a901dc7727cf448cae36daaefaba79de33b5058dab79aa4c04aefb
LABEL MAINTAINER=davralin
LABEL org.opencontainers.image.source=https://github.com/davralin/containers

RUN sed '/default_type/a \ \ \ \ server_tokens off;' -i /etc/nginx/nginx.conf
RUN sed '/server_name/a \ \ \ \ autoindex\ \ \ on;' -i /etc/nginx/conf.d/default.conf
