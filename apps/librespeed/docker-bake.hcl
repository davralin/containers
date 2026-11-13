variable "APP" {
  default = "librespeed"
}

variable "VERSION" {
  // renovate: datasource=docker depName=ghcr.io/librespeed/speedtest versioning=semver
  default = "6.3.1"
}

variable "DIGEST" {
  default = "sha256:bc34bf69b6c102b23ab81b6e77beb7cce321fb0d3be33ec6e80edef3e9dd8bab"
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
    VERSION = VERSION
    DIGEST  = DIGEST
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
