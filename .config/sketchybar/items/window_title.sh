sketchybar -m --add event window_focus
sketchybar --add event title_change

sketchybar -m --add item title left
sketchybar --set title script="$PLUGIN_DIR/window_title.sh"
sketchybar --set title label.color=$WHITE
sketchybar --set title label.font="$FONT:Black:12.0"
sketchybar --set title label.padding_left=0
sketchybar --set title icon.padding_left=0
sketchybar --set title background.padding_left=0
sketchybar --subscribe title window_focus front_app_switched space_change title_change
