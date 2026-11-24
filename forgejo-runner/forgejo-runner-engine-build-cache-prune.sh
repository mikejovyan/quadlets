#!/bin/bash
set -e

HELPER_IMAGE="quay.io/podman/stable:latest"
BUILD_CACHE_VOLUME="forgejo-runner-jobs-build-cache"

podman exec forgejo-runner-engine \
  podman run --rm --privileged --volume "${BUILD_CACHE_VOLUME}:/var/lib/containers" "${HELPER_IMAGE}" \
  podman image prune --all --force --filter "until=720h"
