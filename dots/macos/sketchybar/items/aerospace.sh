#!/usr/bin/env bash

SPACE_ICONS=("󰇧" "" "" "" "󰀻" "󰀻" "󰀻" "" "")

sketchybar --add event aerospace_workspace_change

# TODO: aerospace for now doesn't seem to support list windows in a particular
# workspace. If we had that, we could modify the color of the icon depending on
# whether the workspace has anythign in it.
# TODO: likewise for the current mode.
for sid in $(aerospace list-workspaces --all); do
    icon_index=$((sid - 1))
    icon="${SPACE_ICONS[$icon_index]}"

    sketchybar --add item space.$sid left \
        --subscribe space.$sid aerospace_workspace_change \
        --set space.$sid \
        icon="$icon" \
        icon.font="$FONT:Bold:18.0" \
        icon.color=$YELLOW \
        icon.padding_left=3 \
        icon.padding_right=1 \
        label.drawing=off \
        click_script="aerospace workspace $sid" \
        script="$CONFIG_DIR/plugins/aerospace.sh $sid"
done
