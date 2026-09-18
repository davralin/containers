FROM nginx:1.31.6-alpine-slim@sha256:5a9423ea46b45f4025fe28a74c7ccea42291c8f54f828c7cadc2d75faca1abe5
LABEL MAINTAINER=davralin
LABEL org.opencontainers.image.source=https://github.com/davralin/containers

RUN sed '/default_type/a \ \ \ \ server_tokens off;' -i /etc/nginx/nginx.conf
RUN sed '/server_name/a \ \ \ \ autoindex\ \ \ on;' -i /etc/nginx/conf.d/default.conf
