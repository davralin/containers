# containers

A collection of personal container images, built with GitHub Actions for `linux/amd64` and `linux/arm64`.

## Images

| Container | Description | Base Image | Status |
|-----------|-------------|------------|--------|
| `awx-ee` | AWX Execution Environment for Ansible | `quay.io/ansible/awx-ee` | ✅ |
| `beets` | Music tagger/organizer for continuous import in Kubernetes | `debian:slim` | ✅ |
| `borgmatic` | Borgbackup automation wrapper | `debian:slim` | ✅ |
| `comics` | [Comics](https://github.com/jodal/comics) web app (Django) | `python:slim-bookworm` | ✅ |
| `huggingface-cli` | Download models from HuggingFace | `debian:slim` | ✅ |
| `isync` | IMAP mailbox sync (mbsync) | `debian:slim` | ✅ |
| `mpd` | Music Player Daemon (internal radio station) | `debian:slim` | ✅ |
| `nginx-autoindex` | Nginx with autoindex enabled, server_tokens disabled | `nginx:alpine-slim` | ✅ |
| `ripbox` | yt-dlp + spotdl media downloader with support tools | `debian:slim` | ✅ |
| `rsync` | rsync file transfer | `debian:slim` | ✅ |
| `sleep` | Continuous sleep container (debug shell / sidecar) | `debian:slim` | ✅ |
| `sshd` | SSH daemon | `debian:slim` | ✅ |
| `streamripper` | Internet radio stream ripper | `debian:slim` | ✅ |
| `utility` | General-purpose tools (curl, vim, ffmpeg, calibre, sqlite3, etc.) | `debian:slim` | ✅ |
| `vdirsyncer` | CalDAV/CardDAV synchronization | `debian:slim` | ⚠️ Deprecated |

> **Deprecated** images are kept as long as they don't cost time or money to maintain, but are no longer actively used.

## Registries

All images are published to both Docker Hub and GitHub Container Registry:

```bash
# Docker Hub
docker pull davralin/<name>:latest

# GHCR
docker pull ghcr.io/davralin/<name>:latest
```

## Build

Each container has its own GitHub Actions workflow that builds multi-arch images (`linux/amd64` + `linux/arm64`) on push.

Base images are pinned by version and digest. [Renovate](https://github.com/renovatebot/renovate) keeps them up to date — both version bumps and digest changes (security rebuilds) are tracked automatically.

## License

[GPL-3.0](LICENSE)
