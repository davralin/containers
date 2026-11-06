# AGENTS.md

## Commit Style

- **Atomic commits** — each commit is one logical, self-contained change
- **Atomic PRs** — each pull request contains only related, grouped commits
- Use [Conventional Commits](https://www.conventionalcommits.org/): `type(scope): description`
  - `feat`, `fix`, `chore`, `docs`, `refactor`, `test`, `ci`
- Keep commit messages concise; use the body for detail when needed

## Pull Requests

- One PR per logical change or feature
- Squash/rebase before merging if intermediate commits aren't meaningful
- PR title should follow the same conventional commit format

## Architecture Decisions

- Read the relevant records in `adr/` before changing durable image, build,
  release, security, dependency, or runtime policy.
- Add or update an ADR when changing a lasting repository default; supersede a
  record instead of deleting history. Do not create ADRs for routine fixes or
  dependency bumps.

| ADR | Decision |
| --- | --- |
| `0001` | ADR governance |
| `0002` | Per-app image build and test contract |
| `0003` | Registry, tags, and digest deployment model |
| `0004` | Renovate dependency management and automerge |
| `0005` | Release attestation, signing, and security reporting |
| `0006` | Container healthcheck semantics |
| `0007` | AWX execution-environment architecture |

## Container Images

- Base images are pinned by version and digest (e.g. `debian:13.4-slim@sha256:...`)
- [Renovate](https://github.com/renovatebot/renovate) manages base image updates
- Apps under `apps/<name>` use the shared pull-request, release, and app-builder workflows for multi-arch builds (`linux/amd64` + `linux/arm64`)
- Images are published to Docker Hub (`davralin/<name>`) and GHCR (`ghcr.io/davralin/<name>`)
- Each app provides an executable `test.sh`; single-purpose command-line images should verify their primary command with its version flag and derive their release version from the installed primary application package
