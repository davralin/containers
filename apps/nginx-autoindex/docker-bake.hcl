variable "APP" {
  default = "nginx-autoindex"
}

variable "VERSION" {
  // renovate: datasource=docker depName=docker.io/library/nginx versioning=semver
  default = "1.31.8"
}

variable "DIGEST" {
  default = "sha256:6e67f8eaac94fc456588d4ff6c470d984841f5b5dc4279863d5cbe6ec5a60def"
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
