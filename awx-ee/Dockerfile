FROM quay.io/ansible/awx-ee:24.2.0
LABEL MAINTAINER davralin
LABEL org.opencontainers.image.source https://github.com/davralin/containers

USER root
RUN ansible-galaxy collection install community.general

RUN pip install mitogen --no-input

USER 1000
