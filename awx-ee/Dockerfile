FROM quay.io/ansible/awx-ee:24.6.1@sha256:89593d2a0268acacdbd1c075d8810ab50d961cf7769e36de19219bb6cb4efcc1
LABEL MAINTAINER=davralin
LABEL org.opencontainers.image.source=https://github.com/davralin/containers

USER root
RUN dnf install -y \
  jq	\
  rhel-system-roles \
  rsync \
  python-ldap

RUN ansible-galaxy collection install -p /usr/share/ansible/collections \
    ansibleguy.opnsense \
    awx.awx \
    ansible.posix \
    community.crypto \
    community.general \
    community.windows \
    containers.podman

USER 1000
