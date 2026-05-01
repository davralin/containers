FROM ghcr.io/openclaw/openclaw:2026.4.29@sha256:2c56a23cb2fe826a0d521bf6d61c8e4bb4e4201274f358eccddf5876393155ae
LABEL MAINTAINER=davralin
LABEL org.opencontainers.image.source=https://github.com/davralin/containers

USER root

# Install useful tools missing from the base image:
#   jq      - JSON processing (used in heartbeat scripts)
#   python3 - RSS parsing, Prometheus queries, HA MCP scripts
#   yq      - YAML processing (installed from binary, not in bookworm apt)
#   kubectl - Kubernetes CLI
#   vim-tiny, less - debugging utilities
RUN \
  /usr/bin/apt-get -y update && \
  /usr/bin/apt-get -y install --no-install-recommends \
    jq \
    less \
    openssh-client \
    python3 \
    vim-tiny && \
  /usr/bin/rm -rf /var/lib/apt/lists/* && \
  ARCH=$(dpkg --print-architecture) && \
  curl -fsSL "https://github.com/mikefarah/yq/releases/latest/download/yq_linux_${ARCH}" \
    -o /usr/local/bin/yq && \
  chmod +x /usr/local/bin/yq && \
  curl -fsSL "https://dl.k8s.io/release/$(curl -fsSL https://dl.k8s.io/release/stable.txt)/bin/linux/${ARCH}/kubectl" \
    -o /usr/local/bin/kubectl && \
  chmod +x /usr/local/bin/kubectl

USER node
