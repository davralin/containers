# openclaw

Custom OpenClaw image built on top of the official `ghcr.io/openclaw/openclaw` image.

Adds tools missing from the base image that are used in heartbeat scripts and agent tasks:

- `jq` — JSON processing
- `python3` — RSS parsing, Prometheus queries, HA MCP scripts
- `yq` — YAML processing
- `vim-tiny`, `less` — debugging utilities

## Tags

- `latest` — tracks the latest build
- `<upstream-tag>` — matches the upstream OpenClaw version (e.g. `2026.4.5`)

## Usage

```yaml
image:
  repository: ghcr.io/davralin/openclaw
  tag: 2026.4.5
```
