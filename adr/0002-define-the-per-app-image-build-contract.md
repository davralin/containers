# 0002. Define the Per-App Image Build Contract

Date: 2026-11-06

## Status

Accepted

## Context

The repository publishes a catalog of independent images. A common structure
and workflow contract keeps local development, pull-request validation, and
release builds consistent while allowing app-specific implementation details.

## Decision

Each image lives under `apps/<name>` and provides a `docker-bake.hcl` build
definition and executable `test.sh`. The app owns its Containerfile or build
source and any app-specific version discovery.

The shared pull-request and release workflows discover changed app directories
and invoke the reusable app-builder workflow. Pull requests build a native
image and run the app smoke test. Releases build and publish
`linux/amd64` and `linux/arm64` images.

`test.sh` is the local and CI smoke-test entry point. It must prove the image's
primary behavior is available; a version command is sufficient for a
single-purpose command-line image, while services and generated execution
environments require behavior-appropriate checks.

## Consequences

New images have a predictable interface and benefit from the shared workflow.
Changes outside an app directory do not automatically exercise every app, so
shared workflow and policy changes require deliberate review.
