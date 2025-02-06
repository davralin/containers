FROM nginx:1.27.4-alpine-slim
LABEL MAINTAINER davralin
LABEL org.opencontainers.image.source https://github.com/davralin/containers

RUN sed 's/listen       80/listen       8080/g' -i /etc/nginx/conf.d/default.conf
ADD index.html /usr/share/nginx/html/
ADD go-away.jpg /usr/share/nginx/html/
