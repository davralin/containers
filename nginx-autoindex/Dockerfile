FROM nginx:1.31.0-alpine-slim@sha256:9e666aeefa9801445bc2ff4994c48d314736dae4cf1f551ace03e38ea0373552
LABEL MAINTAINER=davralin
LABEL org.opencontainers.image.source=https://github.com/davralin/containers

RUN sed '/default_type/a \ \ \ \ server_tokens off;' -i /etc/nginx/nginx.conf
RUN sed '/server_name/a \ \ \ \ autoindex\ \ \ on;' -i /etc/nginx/conf.d/default.conf
