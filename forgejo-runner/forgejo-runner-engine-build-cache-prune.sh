#!/bin/bash
set -e

HELPER_IMAGE="forgejo-runner-jobs:latest"
BUILD_CACHE_VOLUME="forgejo-runner-jobs-build-cache"
VAR_TMP_PATH="/var/tmp"
HOSTEDTOOLCACHE_PATH="/opt/hostedtoolcache"

podman exec forgejo-runner-engine \
  podman run --rm --privileged --volume "${BUILD_CACHE_VOLUME}:/var/lib/containers" --tmpfs "${VAR_TMP_PATH}" --tmpfs "${HOSTEDTOOLCACHE_PATH}" "${HELPER_IMAGE}" \
  podman image prune --all --force --filter "until=720h"
