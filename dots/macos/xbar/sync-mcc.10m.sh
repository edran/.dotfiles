#!/usr/bin/env bash

# To install:
# $ ln -s ~/.dotfiles/dots/macos/xbar/sync-mcc.sh \
#         ~/Library/Application\ Support/xbar/plugins/sync-mcc.10m.sh

# <xbar.title>MCC Sync</xbar.title>
# <xbar.author>Nantas Nardelli</xbar.author>
# <xbar.image></xbar.image>
# <xbar.dependencies>git</xbar.dependencies>

set -e

source "$HOME/.profile"

clickable_history () {
    logs=$(git log -5 --pretty=format:"%h;%ar")
    while read -r commit
    do
        commit=(${commit//;/ })
        echo "${commit[0]} (${commit[@]:1}) | href=https://github.com/edran/mcc/commit/${commit[0]}"
    done <<< "$logs"
}

if [ -z "$ORGDIR" ]; then
    echo ":rocket::warning:"
    echo "---"
    echo "ORGDIR is not set (or empty)"
    exit
fi

ssh-add ~/.ssh/github
pushd $ORGDIR > /dev/null

if [[ -z $(git status -s) ]]; then
    echo ":rocket::white_circle:"
    echo "---"
    echo "No changes detected in $ORGDIR at $(date)."
    echo "---"
    git pull
    clickable_history
else
    echo ":rocket::full_moon:"
    echo "---"
    git add -A
    echo "---"
    git commit -m "Changes up to $(date)"
    echo "---"
    git push
    echo "---"
    clickable_history
fi
