variable "APP" {
  default = "awx-ee"
}

variable "ANSIBLE_CORE_VERSION" {
  // renovate: datasource=pypi depName=ansible-core versioning=pep440
  default = "2.21.5"
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
  context    = ".build"
  dockerfile = "Containerfile"

  labels = {
    "org.opencontainers.image.source"  = SOURCE
    "org.opencontainers.image.version" = ANSIBLE_CORE_VERSION
    "org.opencontainers.image.vendor"  = "davralin"
  }
}

# The local target mirrors the upstream app interface while preserving a
# caller-supplied tag for smoke tests.
target "image-local" {
  inherits = ["image"]
  output   = ["type=docker"]
  tags     = TAGS == "" ? ["${APP}:${ANSIBLE_CORE_VERSION}"] : split(",", TAGS)
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
