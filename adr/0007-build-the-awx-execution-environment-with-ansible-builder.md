# 0007. Build the AWX Execution Environment with Ansible Builder

Date: 2026-11-06

## Status

Accepted

## Context

Upstream AWX execution-environment base bundles a broad upstream package
inventory and its associated vulnerability surface. This repo needs only
a focused Ansible runtime and a small set of collections.

## Decision

Build `awx-ee` from the Ansible Builder v3 definition in
`apps/awx-ee/execution-environment.yml`. Use the version-and-digest-pinned UBI
10 base, the Python stream supplied by that UBI release, pinned Ansible Core
and Runner packages, declared Galaxy collections, and only required RPM
dependencies.

`generate.sh` creates the ignored Builder context consumed by Docker Bake.
The image version tag and OCI version label equal the installed Ansible Core
version. Python is selected with the UBI base because it is an RPM stream
compatibility choice, not an independently Renovate-managed Docker image.

## Consequences

The execution environment has a smaller, explicit dependency surface and can
be tested locally with the same generated build context used by CI. Moving to a
new Ansible Core major requires checking its Python requirement against the
selected UBI stream, then validating representative AWX jobs after release.
