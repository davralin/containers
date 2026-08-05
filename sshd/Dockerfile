FROM debian:13.6-slim@sha256:3a39a0592364683e6bab97937b72cad5a8fa6dcbbee90edb3bb48c7f8e94f258
LABEL MAINTAINER=davralin
LABEL org.opencontainers.image.source=https://github.com/davralin/containers

RUN groupadd -g 1000 group && \
    useradd -m -u 1000 -g group user

RUN \
  /usr/bin/apt-get -y update && \
  /usr/bin/apt-get -y install --no-install-recommends \
    openssh-server \
    openssh-sftp-server && \
  /usr/bin/rm -rf /var/lib/apt/lists/* && \
  /usr/bin/rm -rf /etc/ssh/*.key && \
  /usr/bin/rm -rf /etc/ssh/*.pub && \
  /usr/bin/sed 's|UsePAM yes|UsePAM no|g' -i /etc/ssh/sshd_config && \
  /usr/bin/sed 's|#HostKey /etc/ssh/ssh_host_ed25519_key|HostKey /home/user/ssh/ssh_host_ed25519_key|g' -i /etc/ssh/sshd_config && \
  /usr/bin/sed 's|#AuthorizedKeysFile	.ssh/authorized_keys .ssh/authorized_keys2|AuthorizedKeysFile	ssh/authorized_keys|g' -i /etc/ssh/sshd_config

ADD entrypoint.sh /usr/local/bin/entrypoint.sh

USER user:group

RUN /usr/bin/mkdir -p /home/user/ssh

EXPOSE 2222

CMD ["/usr/local/bin/entrypoint.sh"]
