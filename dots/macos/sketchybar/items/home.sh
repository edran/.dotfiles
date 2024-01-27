POPUP_OFF='sketchybar --set apple.logo popup.drawing=off'
POPUP_CLICK_SCRIPT='sketchybar --set $NAME popup.drawing=toggle'

home_logo=(
  icon="󰘧"
  icon.font="$FONT:Bold:15.0"
  icon.color=$GREEN
  padding_right=5
  y_offset=1
  label.drawing=off
  click_script="$POPUP_CLICK_SCRIPT"
  popup.height=35
)

home_prefs=(
  icon=""
  padding_left=10
  padding_right=10
  label="Preferences"
  click_script="open -a 'System Preferences'; $POPUP_OFF"
)

home_activity=(
  icon=""
  padding_left=10
  padding_right=10
  label="Activity"
  click_script="open -a 'Activity Monitor'; $POPUP_OFF"
)

home_lock=(
  icon=""
  padding_left=10
  padding_right=10
  label="Lock Screen"
  click_script="osascript -e 'tell application \"System Events\" to keystroke \"q\" using {command down,control down}'; $POPUP_OFF"
)

sketchybar --add item apple.logo left                 \
           --set apple.logo "${home_logo[@]}"         \
                                                      \
           --add item apple.prefs popup.apple.logo    \
           --set apple.prefs "${home_prefs[@]}"       \
                                                      \
           --add item apple.activity popup.apple.logo \
           --set apple.activity "${home_activity[@]}" \
                                                      \
           --add item apple.lock popup.apple.logo     \
           --set apple.lock "${home_lock[@]}"
