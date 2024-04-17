FROM quay.io/ansible/awx-ee:24.2.0
LABEL MAINTAINER davralin
LABEL org.opencontainers.image.source https://github.com/davralin/containers

USER root
RUN ansible-galaxy collection install community.general
RUN ansible-galaxy collection install awx.awx
RUN ansible-galaxy collection install pfsensible.core

RUN pip install mitogen --no-input

USER 1000
