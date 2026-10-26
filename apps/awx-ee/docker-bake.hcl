variable "APP" {
  default = "awx-ee"
}

variable "VERSION" {
  // renovate: datasource=docker depName=quay.io/ansible/awx-ee versioning=semver
  default = "24.6.1"
}

variable "DIGEST" {
  default = "sha256:89593d2a0268acacdbd1c075d8810ab50d961cf7769e36de19219bb6cb4efcc1"
}

variable "TAGS" {
  default = ""
}

variable "SOURCE" {
  default = "https://github.com/davralin/containers"
}

group "default" {
  targets = ["image-local"]
}

target "image" {
  context    = "."
  dockerfile = "Containerfile"

  args = {
    VERSION = VERSION
    DIGEST  = DIGEST
  }

  labels = {
    "org.opencontainers.image.source"  = SOURCE
    "org.opencontainers.image.version" = VERSION
    "org.opencontainers.image.vendor"  = "davralin"
  }
}

# The local target mirrors the upstream app interface while preserving a
# caller-supplied tag for smoke tests.
target "image-local" {
  inherits = ["image"]
  output   = ["type=docker"]
  tags     = TAGS == "" ? ["${APP}:${VERSION}"] : split(",", TAGS)
}

target "image-all" {
  inherits = ["image"]
  platforms = [
    "linux/amd64",
    "linux/arm64",
  ]
  tags = TAGS == "" ? [] : split(",", TAGS)
  attest = [
    "type=provenance,mode=max",
    "type=sbom",
  ]
}
