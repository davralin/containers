# 0004. Manage Dependencies with Renovate

Date: 2026-11-06

## Status

Accepted

## Context

Container base images, build tools, language dependencies, GitHub Actions, and
custom Docker Bake variables all need regular maintenance. Manual tracking is
error-prone, particularly for digest-only rebuilds.

## Decision

Pin declarative image inputs by version and digest, and use Renovate to update
them. Renovate also manages supported package pins, GitHub Actions, Ansible
Galaxy requirements, and annotated custom dependency declarations.

Renovate is configured to automerge all supported update classes with branch
automerge. Update declarations and Renovate custom managers must preserve
version-and-digest pairs atomically where both values define an image.

The current pull-request workflow is triggered by app and app-builder workflow
changes, but its image smoke tests run only when an app directory changed.

## Consequences

Dependencies and rebuild digests are maintained continuously with less manual
work. Major or infrastructure-affecting updates can merge automatically, so
the image-specific smoke tests and downstream deployment validation remain
important safeguards.
