FROM debian:13.7-slim@sha256:62bd423aeee912639ca8ee681c2b762cb3e25137e0a92b20be455898a9f034ad
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
