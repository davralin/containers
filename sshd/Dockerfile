FROM debian:stable-20241111-slim
LABEL MAINTAINER davralin
LABEL org.opencontainers.image.source https://github.com/davralin/containers

RUN groupadd -g 1000 group && \
    useradd -m -u 1000 -g group user

RUN \
  /usr/bin/apt-get -y update && \
  /usr/bin/apt-get -y install --no-install-recommends \
    openssh-server \
    rsync \
    && \
    /bin/rm -rf /etc/ssh/*.key \
    /bin/rm -rf /etc/ssh/*.pub \
    /bin/rm -rf /var/lib/apt/lists/*

ADD entrypoint.sh /usr/local/bin/entrypoint.sh

RUN /bin/echo "HostKey /home/user/ssh_host_ed25519_key" >> /etc/ssh/sshd_config

USER user:group

EXPOSE 2222

CMD ["/usr/local/bin/entrypoint.sh"]