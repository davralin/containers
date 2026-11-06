# 0001. Use ADRs for Repository Decisions

Date: 2026-11-06

## Status

Accepted

## Context

This repository has durable decisions about how container images are built,
released, signed, scanned, and maintained. Recording them only in workflows,
comments, or commit history makes the rationale difficult to discover.

## Decision

Use Architecture Decision Records (ADRs) for durable repository decisions.

An ADR is required for a lasting default affecting image architecture, build
and release behavior, supply-chain security, vulnerability reporting,
dependency maintenance, or runtime conventions. Routine implementation work,
dependency bumps, and short-lived operational work do not require an ADR.

When a decision changes, update its ADR if the record remains accurate, or add
a new ADR that supersedes it. Do not delete historical ADRs.

## Consequences

Durable policy is explicit, reviewable, and available to maintainers and
automation. The README can remain an operational overview rather than a
complete decision history.
