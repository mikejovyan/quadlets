#!/bin/sh
set -e

sed \
  -e "s|__FORGEJO_URL__|$FORGEJO_URL|" \
  -e "s|__FORGEJO_UUID__|$FORGEJO_UUID|" \
  -e "s|__FORGEJO_TOKEN__|$FORGEJO_TOKEN|" \
  /data/config-template.yml > /tmp/config.yml

exec forgejo-runner --config /tmp/config.yml daemon
