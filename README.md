# containers

A collection of personal container images, built with GitHub Actions for `linux/amd64` and `linux/arm64`.

## Images

| Container | Description | Base Image | Status |
|-----------|-------------|------------|--------|
| `awx-ee` | AWX Execution Environment for Ansible | `quay.io/ansible/awx-ee` | ✅ |
| `beets` | Music tagger/organizer for continuous import in Kubernetes | `debian:slim` | ✅ |
| `borgmatic` | Borgbackup automation wrapper | `debian:slim` | ✅ |
| `huggingface-cli` | Download models from HuggingFace | `debian:slim` | ✅ |
| `isync` | IMAP mailbox sync (mbsync) | `debian:slim` | ✅ |
| `mpd` | Music Player Daemon (internal radio station) | `debian:slim` | ✅ |
| `nginx-autoindex` | Nginx with autoindex enabled, server_tokens disabled | `nginx:alpine-slim` | ✅ |
| `ripbox` | yt-dlp + spotdl media downloader with support tools | `debian:slim` | ✅ |
| `rsync` | rsync file transfer | `debian:slim` | ✅ |
| `sleep` | Continuous sleep container (debug shell / sidecar) | `debian:slim` | ✅ |
| `sshd` | SSH daemon | `debian:slim` | ⚠️ Deprecated |
| `streamripper` | Internet radio stream ripper | `debian:slim` | ✅ |
| `utility` | General-purpose tools (curl, vim, ffmpeg, calibre, sqlite3, etc.) | `debian:slim` | ✅ |
| `vdirsyncer` | CalDAV/CardDAV synchronization | `debian:slim` | ⚠️ Deprecated |

> **Deprecated** images are kept as long as they don't cost time or money to maintain, but are no longer actively used.

## Registries

All images are published to both Docker Hub and GitHub Container Registry:

```bash
# Select an image tag
docker pull davralin/<name>:<tag>
docker pull ghcr.io/davralin/<name>:<tag>
```

## Build

Apps under `apps/<name>` use the repository-level pull-request and release workflows for multi-architecture builds (`linux/amd64` + `linux/arm64`).

The repository-level workflows discover changed app directories and delegate each build to a reusable app builder. Pull requests receive a local build and smoke test; `main` and manual releases publish the app-declared version and the `rolling` tag. They do not publish `latest`.

Build and smoke-test an app locally:

```bash
./apps/awx-ee/test.sh
```

Base images are pinned by version and digest. [Renovate](https://github.com/renovatebot/renovate) keeps them up to date — both version bumps and digest changes (security rebuilds) are tracked automatically.

## Security

Release images include BuildKit SBOM and provenance attestations and are signed with GitHub Actions OIDC. Deploy immutable digests rather than the mutable `rolling` tag, and verify the signature before deployment:

```bash
cosign verify \
  --certificate-oidc-issuer https://token.actions.githubusercontent.com \
  --certificate-identity-regexp '^https://github.com/davralin/containers/.*$' \
  ghcr.io/davralin/<name>@sha256:<digest>
```

The release workflow reports Trivy findings to GitHub Security without blocking publication. A scheduled workflow scans each published app weekly with Trivy and Grype and uploads both SARIF reports.

Long-running services must define a meaningful container `HEALTHCHECK`. Execution environments and one-shot images must explicitly use `HEALTHCHECK NONE`.

## License

[GPL-3.0](LICENSE)
