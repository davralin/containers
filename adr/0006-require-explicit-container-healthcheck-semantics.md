# 0006. Require Explicit Container Healthcheck Semantics

Date: 2026-11-06

## Status

Accepted

## Context

Container health status must mean something useful to an orchestrator. A
generic process check is often misleading for a service, while one-shot tools
do not provide a long-running service to probe.

## Decision

Long-running services must define a meaningful `HEALTHCHECK` that verifies
their intended runtime behavior.
For containers with no long-running service, one should fall back to
declaring `HEALTHCHECK NONE`.

Healthcheck behavior is part of an image's runtime contract and should be
considered when adding an image or changing its process model.

## Consequences

Orchestrators receive a deliberate health signal.
