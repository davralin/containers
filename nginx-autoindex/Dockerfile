FROM nginx:1.31.6-alpine-slim@sha256:80149a0e5bc9fa0b8beaff5b8a453f71ba8ba038895d418381297ffa5cd57782
LABEL MAINTAINER=davralin
LABEL org.opencontainers.image.source=https://github.com/davralin/containers

RUN sed '/default_type/a \ \ \ \ server_tokens off;' -i /etc/nginx/nginx.conf
RUN sed '/server_name/a \ \ \ \ autoindex\ \ \ on;' -i /etc/nginx/conf.d/default.conf
