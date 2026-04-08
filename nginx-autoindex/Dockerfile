FROM nginx:1.29.8-alpine-slim@sha256:34311a2592ef8b857ca342b0d458d2978e4d05ae620ba2da5030f3d7c9b4774c
LABEL MAINTAINER=davralin
LABEL org.opencontainers.image.source=https://github.com/davralin/containers

RUN sed '/default_type/a \ \ \ \ server_tokens off;' -i /etc/nginx/nginx.conf
RUN sed '/server_name/a \ \ \ \ autoindex\ \ \ on;' -i /etc/nginx/conf.d/default.conf
