FROM nginx:1.31.6-alpine-slim@sha256:543794466008da7c887cc9f4fce6b33674835dde6d33cf5339316ee044e79c02
LABEL MAINTAINER=davralin
LABEL org.opencontainers.image.source=https://github.com/davralin/containers

RUN sed '/default_type/a \ \ \ \ server_tokens off;' -i /etc/nginx/nginx.conf
RUN sed '/server_name/a \ \ \ \ autoindex\ \ \ on;' -i /etc/nginx/conf.d/default.conf
