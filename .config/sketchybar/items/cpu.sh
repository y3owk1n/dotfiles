#!/usr/bin/env sh

sketchybar -m --add item cpu right
sketchybar --set cpu update_freq=2
sketchybar --set cpu script="$PLUGIN_DIR/cpu.sh"
sketchybar --set cpu icon=􀫥
sketchybar --set cpu icon.padding_left=8
sketchybar --set cpu icon.color=$BLACK
sketchybar --set cpu label.padding_right=8
sketchybar --set cpu label.color=$BLACK
sketchybar --set cpu background.height=24
sketchybar --set cpu background.color=$MAGENTA
sketchybar --set cpu background.drawing=on
