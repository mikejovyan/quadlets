#!/bin/sh
set -e

set -a
. "$(dirname "$0")/quadlets.env"
set +a

exclude_paths=""
for dir in $SYNC_EXCLUDE_DIRS; do
  exclude_paths="$exclude_paths /tmp/quadlets-deploy/$dir"
done

git archive --remote="$FORGEJO_REMOTE" main | ssh "$SSH_USER@$SSH_HOST" "
  rm -rf /tmp/quadlets-deploy && mkdir -p /tmp/quadlets-deploy &&
  tar -x -C /tmp/quadlets-deploy &&
  ${exclude_paths:+rm -rf$exclude_paths &&}
  rsync -a /tmp/quadlets-deploy/ ~/.config/containers/systemd/ &&
  rm -rf /tmp/quadlets-deploy
"
