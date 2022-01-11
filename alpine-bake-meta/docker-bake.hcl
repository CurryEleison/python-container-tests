target "docker-metadata-action" {}

target "build" {
  inherits = ["docker-metadata-action"]
  context = "./"
  dockerfile = "alpine-bake-meta/Dockerfile"
  platforms = [
    "linux/amd64",
    "linux/arm64"
  ]
}