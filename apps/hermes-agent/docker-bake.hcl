variable "APP" {
  default = "hermes-agent"
}

variable "PYTHON_VERSION" {
  // renovate: datasource=docker depName=docker.io/library/python versioning=semver
  default = "3.14-slim-trixie"
}

variable "PYTHON_DIGEST" {
  default = "sha256:930e1abba7c4e8f96ed93e8012c35d174d7732752731bbd5e8e757d7ec6f3966"
}

variable "UPSTREAM_VERSION" {
  // renovate: datasource=github-tags depName=NousResearch/hermes-agent versioning=semver
  default = "v0.23.0"
}

variable "SOURCE_COMMIT" {
  default = "bf0203a794a07aac3ff764972ab9087baa4e4f4e"
}

variable "SOURCE_SHA256" {
  default = "0dc2cca54657d162845a77f634e107c61c3fb0bd6c8505212aa2e200591b7cc9"
}

variable "UV_VERSION" {
  // renovate: datasource=docker depName=ghcr.io/astral-sh/uv versioning=semver
  default = "0.13.7"
}

variable "UV_DIGEST" {
  default = "sha256:96f40d3904aad8d0bd010539001d36c8e2188b981e1334471a90c4a1d93bb490"
}

variable "SQLITE_AUTOCONF_VERSION" {
  default = "3530400"
}

variable "SQLITE_SHA256" {
  default = "0e9483900e92cd5de8fd48d16bf9200145a61f7fd5be542a5ac81d8a9516eb9c"
}

variable "IMAGE_VERSION" {
  default = "${UPSTREAM_VERSION}"
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
    PYTHON_VERSION          = PYTHON_VERSION
    PYTHON_DIGEST           = PYTHON_DIGEST
    UPSTREAM_VERSION        = UPSTREAM_VERSION
    SOURCE_COMMIT           = SOURCE_COMMIT
    SOURCE_SHA256           = SOURCE_SHA256
    UV_VERSION              = UV_VERSION
    UV_DIGEST               = UV_DIGEST
    SQLITE_AUTOCONF_VERSION = SQLITE_AUTOCONF_VERSION
    SQLITE_SHA256           = SQLITE_SHA256
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
  tags     = TAGS == "" ? ["${APP}:${IMAGE_VERSION}"] : split(",", TAGS)
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
