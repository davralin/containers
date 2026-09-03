FROM nginx:1.31.5-alpine-slim@sha256:ac8c92d192f5d66410fae6fbb3addac897c3bb690e221303588e3b32373972c1
LABEL MAINTAINER=davralin
LABEL org.opencontainers.image.source=https://github.com/davralin/containers

RUN sed '/default_type/a \ \ \ \ server_tokens off;' -i /etc/nginx/nginx.conf
RUN sed '/server_name/a \ \ \ \ autoindex\ \ \ on;' -i /etc/nginx/conf.d/default.conf
