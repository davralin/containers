FROM quay.io/ansible/awx-ee:24.6.1
LABEL MAINTAINER davralin
LABEL org.opencontainers.image.source https://github.com/davralin/containers

USER root
RUN dnf install -y \
  jq	\
  rsync
RUN echo "Installing ansible-galaxy-things" \
    ansible-galaxy collection install ansibleguy.opnsense -p /usr/share/ansible/collections \
    ansible-galaxy collection install awx.awx -p /usr/share/ansible/collections \
    ansible-galaxy collection install community.general -p /usr/share/ansible/collections \
    ansible-galaxy collection install community.windows -p /usr/share/ansible/collections \

USER 1000
