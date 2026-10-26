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

## Container Images

- Base images are pinned by version and digest (e.g. `debian:13.4-slim@sha256:...`)
- [Renovate](https://github.com/renovatebot/renovate) manages base image updates
- Apps under `apps/<name>` use the shared pull-request, release, and app-builder workflows for multi-arch builds (`linux/amd64` + `linux/arm64`)
- Images are published to Docker Hub (`davralin/<name>`) and GHCR (`ghcr.io/davralin/<name>`)
- Each app provides an executable `test.sh`; single-purpose command-line images should verify their primary command with its version flag
