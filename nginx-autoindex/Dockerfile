FROM nginx:1.31.6-alpine-slim@sha256:b54a1a3219e4b8b90fd4d5d383af7f8843a7b34a8079897cb83487a6a3e1aff3
LABEL MAINTAINER=davralin
LABEL org.opencontainers.image.source=https://github.com/davralin/containers

RUN sed '/default_type/a \ \ \ \ server_tokens off;' -i /etc/nginx/nginx.conf
RUN sed '/server_name/a \ \ \ \ autoindex\ \ \ on;' -i /etc/nginx/conf.d/default.conf
