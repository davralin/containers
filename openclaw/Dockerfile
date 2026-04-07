FROM ghcr.io/openclaw/openclaw:2026.4.5@sha256:f38ff3d987e6c3e2d77bbb379de575f280d16037fd6a7ec334a35d48e480fd54
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
    python3 \
    vim-tiny && \
  /usr/bin/rm -rf /var/lib/apt/lists/* && \
  curl -fsSL "https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64" \
    -o /usr/local/bin/yq && \
  chmod +x /usr/local/bin/yq && \
  curl -fsSL "https://dl.k8s.io/release/$(curl -fsSL https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" \
    -o /usr/local/bin/kubectl && \
  chmod +x /usr/local/bin/kubectl

USER node
