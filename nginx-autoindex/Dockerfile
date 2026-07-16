FROM nginx:1.31.3-alpine-slim@sha256:d08612e21a01bcbb8dbcc4ebff7dc80be5422250acc67ec30dd3e636c3b987ce
LABEL MAINTAINER=davralin
LABEL org.opencontainers.image.source=https://github.com/davralin/containers

RUN sed '/default_type/a \ \ \ \ server_tokens off;' -i /etc/nginx/nginx.conf
RUN sed '/server_name/a \ \ \ \ autoindex\ \ \ on;' -i /etc/nginx/conf.d/default.conf
