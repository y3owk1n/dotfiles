#!/usr/bin/env sh

sketchybar -m --add item battery right
sketchybar --set battery update_freq=120
sketchybar --set battery script="$PLUGIN_DIR/battery.sh"
sketchybar --set battery icon=􀛨
sketchybar --set battery icon.padding_left=8
sketchybar --set battery icon.color=$BLACK
sketchybar --set battery label.padding_right=8
sketchybar --set battery label.color=$BLACK
sketchybar --set battery background.height=24
sketchybar --set battery background.color=$YELLOW
sketchybar --set battery background.drawing=on
