FROM nginx:1.31.2-alpine-slim@sha256:dd722b8ee8794f3c273bfaf8b5351b0652a68ccd73c17e5f0d029857a58f25ef
LABEL MAINTAINER=davralin
LABEL org.opencontainers.image.source=https://github.com/davralin/containers

RUN sed '/default_type/a \ \ \ \ server_tokens off;' -i /etc/nginx/nginx.conf
RUN sed '/server_name/a \ \ \ \ autoindex\ \ \ on;' -i /etc/nginx/conf.d/default.conf
