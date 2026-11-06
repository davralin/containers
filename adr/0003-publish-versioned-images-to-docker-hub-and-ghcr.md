# 0003. Publish Versioned Images to Docker Hub and GHCR

Date: 2026-11-06

## Status

Accepted

## Context

Consumers use images from both Docker Hub and GitHub Container Registry. The
catalog contains different kinds of software, so one repository-wide version
scheme would misrepresent some images.

## Decision

Publish every released image to both `davralin/<name>` on Docker Hub and
`ghcr.io/davralin/<name>` on GHCR.

Each release publishes an app-declared version tag and the mutable `rolling`
and `latest` aliases. An app chooses a version convention that reflects its
primary artifact. A multi-use image may use its versioned base distribution as
that convention when its identity follows the base. When no single primary
artifact determines the version, the image defines its own version to provide
a meaningful release identifier. SemVer is prefered, CalVer is acceptable.

Base-derived version tags advance with the base version. Changes to an image
that do not change its base version may republish the same version tag, so
deployments must use image digests for immutable identity.

Deployments must reference an immutable image digest rather than a mutable
tag. Mutable tags are discovery and convenience aliases, not deployment
identities.

## Consequences

Consumers can use either registry without changing tag semantics. Version
meaning remains useful per image, while digest references provide reproducible
deployments.
