variable "APP" {
  default = "huggingface-cli"
}

variable "VERSION" {
  // renovate: datasource=docker depName=docker.io/library/debian versioning=semver
  default = "13.7"
}

variable "DIGEST" {
  default = "sha256:62bd423aeee912639ca8ee681c2b762cb3e25137e0a92b20be455898a9f034ad"
}

variable "PYPI_VERSION" {
  // renovate: datasource=pypi depName=huggingface_hub versioning=pep440
  default = "2.3.0"
}

variable "IMAGE_VERSION" {
  default = VERSION
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
    VERSION      = VERSION
    DIGEST       = DIGEST
    PYPI_VERSION = PYPI_VERSION
  }

  labels = {
    "org.opencontainers.image.source"  = SOURCE
    "org.opencontainers.image.version" = IMAGE_VERSION
    "org.opencontainers.image.vendor"  = "davralin"
  }
}

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
