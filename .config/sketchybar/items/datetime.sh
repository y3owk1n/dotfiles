#!/usr/bin/env sh

sketchybar --add item datetime right
sketchybar --set datetime update_freq=2
sketchybar --set datetime icon.padding_left=8
sketchybar --set datetime icon.color=$BLACK
sketchybar --set datetime label.color=$BLACK
sketchybar --set datetime label.padding_right=8
sketchybar --set datetime background.height=24
sketchybar --set datetime background.color=$GREEN
sketchybar --set datetime align=center
sketchybar --set datetime script="$PLUGIN_DIR/datetime.sh"
