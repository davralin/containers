# 0005. Attest, Sign, and Report Release Image Security

Date: 2026-11-06

## Status

Accepted

## Context

Released images need traceable build metadata, an independently verifiable
publisher identity, and continuous visibility into actionable vulnerability
findings. This repository does not use a separate SLSA generator workflow.

## Decision

Multi-architecture release builds produce BuildKit provenance and SBOM
attestations. Releases are signed with Cosign using GitHub Actions OIDC for
both Docker Hub and GHCR image references.

Consumers deploy immutable digests and verify the Cosign signature before
deployment. The release workflow scans the locally built release image with
Trivy and Grype and uploads filtered High/Critical SARIF findings without
blocking publication. A weekly workflow scans every published `rolling` image
with both tools and uploads filtered SARIF findings.

Scanner result filtering is part of the security-reporting contract: Trivy
limits SARIF severities and ignores unfixed findings; Grype output is reduced
to SARIF error-level results after scanning fixed findings. Scanner reports
inform remediation but do not by themselves fail a release.

## Consequences

Images have build metadata and a keyless publisher signature.
GitHub Security stays focused on actionable High/Critical findings,
while publication remains available when findings
need separate remediation.
