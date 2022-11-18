#!/usr/bin/env sh

sketchybar --add item calendar right
sketchybar --set calendar icon=cal
sketchybar --set calendar icon.padding_left=8
sketchybar --set calendar icon.color=$BLACK
sketchybar --set calendar label.color=$BLACK
sketchybar --set calendar label.padding_right=8
sketchybar --set calendar background.height=24
sketchybar --set calendar background.color=$GREEN
sketchybar --set calendar align=center
sketchybar --set calendar click_script="$PLUGIN_DIR/zen.sh"
