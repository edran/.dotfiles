#!/usr/bin/env bash

source "$CONFIG_DIR/colors.sh"

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    sketchybar --set $NAME \
        icon.color=$RED
else
    sketchybar --set $NAME \
        icon.color=$YELLOW
fi
