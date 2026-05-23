FROM nginx:1.31.1-alpine-slim@sha256:8cd84e50babda9441af1e031faebd3fecd1e04b15071f5b6d290d6c2030293fc
LABEL MAINTAINER=davralin
LABEL org.opencontainers.image.source=https://github.com/davralin/containers

RUN sed '/default_type/a \ \ \ \ server_tokens off;' -i /etc/nginx/nginx.conf
RUN sed '/server_name/a \ \ \ \ autoindex\ \ \ on;' -i /etc/nginx/conf.d/default.conf
