# Security Policy

## Supported Images

Only the current exact version declared by an app's `docker-bake.hcl` is supported. The `rolling` and `latest` tags are mutable aliases and are not deployment identities.

Deploy images by their immutable digest. Releases include an SBOM, BuildKit provenance, and a keyless Cosign signature from GitHub Actions. Verify a digest before deployment:

```bash
cosign verify \
  --certificate-oidc-issuer https://token.actions.githubusercontent.com \
  --certificate-identity-regexp '^https://github.com/davralin/containers/.*$' \
  ghcr.io/davralin/<name>@sha256:<digest>
```

## Vulnerability Reports

Release and weekly scans upload Trivy and Grype SARIF reports to GitHub Security. Scan findings are non-blocking so that findings without an available upstream remediation remain visible without preventing image publication.

## Health Checks

Images that run a long-lived service must define a meaningful Docker `HEALTHCHECK`. Images that intentionally do not run a service must declare `HEALTHCHECK NONE`.
