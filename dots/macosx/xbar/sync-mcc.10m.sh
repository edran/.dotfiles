#!/usr/bin/env bash

set -e

if [ -z "$ORGDIR" ]; then
   echo "ORGDIR is not set (or empty)"
   exit 1
fi

pushd $ORGDIR

if [[ -z $(git status -s) ]]; then
    echo "No changes detected in $ORGDIR at $(date)."
    exit 0
fi

git add -A
git commit -m "Changes up to $(date)"
git push

popd
