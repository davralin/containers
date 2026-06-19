FROM nginx:1.31.2-alpine-slim@sha256:071d472aeea109db4c23868034c210f14411f13bc8d9936b7a8fa410b765c740
LABEL MAINTAINER=davralin
LABEL org.opencontainers.image.source=https://github.com/davralin/containers

RUN sed '/default_type/a \ \ \ \ server_tokens off;' -i /etc/nginx/nginx.conf
RUN sed '/server_name/a \ \ \ \ autoindex\ \ \ on;' -i /etc/nginx/conf.d/default.conf
