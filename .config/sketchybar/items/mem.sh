#!/usr/bin/env sh

sketchybar -m --add item mem right
sketchybar --set mem update_freq=2
sketchybar --set mem script="$PLUGIN_DIR/mem.sh"
sketchybar --set mem icon=􀫦
sketchybar --set mem icon.padding_left=8
sketchybar --set mem icon.color=$BLACK
sketchybar --set mem label.padding_right=8
sketchybar --set mem label.color=$BLACK
sketchybar --set mem background.height=24
sketchybar --set mem background.color=$RED
sketchybar --set mem background.drawing=on
