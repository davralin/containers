FROM quay.io/ansible/awx-ee:23.9.0
LABEL MAINTAINER davralin
LABEL org.opencontainers.image.source https://github.com/davralin/containers

USER root
RUN ansible-galaxy collection install community.general

USER 1000