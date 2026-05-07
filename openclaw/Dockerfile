FROM ghcr.io/openclaw/openclaw:2026.5.6@sha256:2ca86d6296fe2ae7111dac14843551340a4c5099e01566253b62c4d3e0a337fc
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
