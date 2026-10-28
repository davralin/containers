variable "APP" {
  default = "ripbox"
}

variable "VERSION" {
  // renovate: datasource=docker depName=docker.io/library/debian versioning=semver
  default = "13.7"
}

variable "DIGEST" {
  default = "sha256:8c4733a92aacd0bcff3779eadc35a4a5147f36cb20a5fcb56504cbc740212259"
}

variable "YT_DLP_VERSION" {
  // renovate: datasource=github-releases depName=yt-dlp/yt-dlp versioning=loose
  default = "2026.10.26"
}

variable "SPOTDL_VERSION" {
  // renovate: datasource=pypi depName=spotdl versioning=pep440
  default = "4.6.0"
}

variable "YT_DLP_EJS_VERSION" {
  // renovate: datasource=pypi depName=yt-dlp-ejs versioning=pep440
  default = "0.8.0"
}

variable "CURL_CFFI_VERSION" {
  // renovate: datasource=pypi depName=curl_cffi versioning=pep440
  default = "0.17.0"
}

variable "DENO_VERSION" {
  // renovate: datasource=github-releases depName=denoland/deno versioning=semver
  default = "v2.9.8"
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
    VERSION            = VERSION
    DIGEST             = DIGEST
    YT_DLP_VERSION     = YT_DLP_VERSION
    SPOTDL_VERSION     = SPOTDL_VERSION
    YT_DLP_EJS_VERSION = YT_DLP_EJS_VERSION
    CURL_CFFI_VERSION  = CURL_CFFI_VERSION
    DENO_VERSION       = DENO_VERSION
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
