FROM nginx:1.31.2-alpine-slim@sha256:ef9984ffb35887404165e7060a4c7d059260c798b9912f48e6d3e236f6ec24a7
LABEL MAINTAINER=davralin
LABEL org.opencontainers.image.source=https://github.com/davralin/containers

RUN sed '/default_type/a \ \ \ \ server_tokens off;' -i /etc/nginx/nginx.conf
RUN sed '/server_name/a \ \ \ \ autoindex\ \ \ on;' -i /etc/nginx/conf.d/default.conf
