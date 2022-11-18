#!/usr/bin/env sh

POPUP_CLICK_SCRIPT="sketchybar --set \$NAME popup.drawing=toggle"

sketchybar --add item github.bell right
sketchybar --set github.bell update_freq=180
sketchybar --set github.bell icon.font="$FONT:Bold:12.0"
sketchybar --set github.bell icon=$BELL
sketchybar --set github.bell icon.color=$BLUE
sketchybar --set github.bell label=$LOADING
sketchybar --set github.bell label.highlight_color=$BLUE
sketchybar --set github.bell popup.align=right
sketchybar --set github.bell script="$PLUGIN_DIR/github.sh"
sketchybar --set github.bell click_script="$POPUP_CLICK_SCRIPT"
sketchybar --set github.bell --subscribe github.bell mouse.entered mouse.exited mouse.exited.global

sketchybar --add item github.template popup.github.bell
sketchybar --set github.template drawing=off
sketchybar --set github.template background.corner_radius=12
sketchybar --set github.template background.padding_left=7
sketchybar --set github.template background.padding_right=7
sketchybar --set github.template background.color=$BLACK
sketchybar --set github.template background.drawing=off
sketchybar --set github.template icon.background.height=2
sketchybar --set github.template icon.background.y_offset=-12
