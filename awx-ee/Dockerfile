FROM quay.io/ansible/awx-ee:24.2.0
LABEL MAINTAINER davralin
LABEL org.opencontainers.image.source https://github.com/davralin/containers

USER root
RUN ansible-galaxy collection install community.general -p /usr/share/ansible/collections
RUN ansible-galaxy collection install awx.awx -p /usr/share/ansible/collections
RUN ansible-galaxy collection install pfsensible.core -p /usr/share/ansible/collections
RUN ansible-galaxy collection install community.docker -p /usr/share/ansible/collections
RUN ansible-galaxy collection install community.windows -p /usr/share/ansible/collections

RUN pip install mitogen --no-input

USER 1000
