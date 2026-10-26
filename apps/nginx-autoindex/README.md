# nginx-autoindex

[![Docker Hub pulls](https://img.shields.io/docker/pulls/davralin/nginx-autoindex.svg)](https://hub.docker.com/r/davralin/nginx-autoindex)
[![GHCR package](https://img.shields.io/badge/GHCR-davralin%2Fnginx--autoindex-blue?logo=github)](https://github.com/davralin/containers/pkgs/container/nginx-autoindex)

Nginx with directory autoindex enabled and version disclosure disabled.

The image inherits the official Nginx entrypoint and exposes port 80. Its health check requests the local HTTP endpoint.
