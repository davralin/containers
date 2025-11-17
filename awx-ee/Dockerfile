FROM quay.io/ansible/awx-ee:24.6.1
LABEL MAINTAINER=davralin
LABEL org.opencontainers.image.source=https://github.com/davralin/containers

USER root
RUN dnf install -y \
  jq	\
  rsync \
  python-ldap

RUN ansible-galaxy collection install -p /usr/share/ansible/collections \
    ansibleguy.opnsense \
    awx.awx \
    community.crypto \
    community.general \
    community.windows

USER 1000
