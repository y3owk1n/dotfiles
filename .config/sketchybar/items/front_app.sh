#!/usr/bin/env sh

FRONT_APP_SCRIPT='sketchybar --set $NAME label="$INFO"'

sketchybar --add event window_focus
sketchybar --add event windows_on_spaces

sketchybar --add item system.yabai left
sketchybar --set system.yabai script="$PLUGIN_DIR/yabai.sh"
sketchybar --set system.yabai icon.font="$FONT:Black:12.0"
sketchybar --set system.yabai label.drawing=off
sketchybar --set system.yabai icon.width=22
sketchybar --set system.yabai icon=$YABAI_GRID
sketchybar --set system.yabai icon.color=$ORANGE
sketchybar --set system.yabai updates=on
sketchybar --set system.yabai associated_display=active
sketchybar --subscribe system.yabai window_focus windows_on_spaces mouse.clicked

# sketchybar --add item front_app left
# sketchybar --set front_app script="$FRONT_APP_SCRIPT"
# sketchybar --set front_app icon.drawing=off
# sketchybar --set front_app label.color=$WHITE
# sketchybar --set front_app label.font="$FONT:Black:12.0"
# sketchybar --set front_app background.padding_left=0
# sketchybar --set front_app background.padding_right=10
# sketchybar --set front_app associated_display=active
# sketchybar --subscribe front_app front_app_switched
