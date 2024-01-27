sketchybar --add item front_app left                               \
           --set front_app       script="$PLUGIN_DIR/front_app.sh" \
                                 padding_left=10                   \
                                 padding_right=10                  \
                                 icon.drawing=off                  \
           --subscribe front_app front_app_switched
