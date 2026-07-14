FROM debian:13.6-slim@sha256:020c0d20b9880058cbe785a9db107156c3c75c2ac944a6aa7ab59f2add76a7bd
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
