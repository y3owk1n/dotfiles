#!/usr/bin/env sh

# Trigger the brew_udpate event when brew update or upgrade is run from cmdline
# e.g. via function in .zshrc

sketchybar --add event brew_update
sketchybar --add item brew right
sketchybar --set brew script="$PLUGIN_DIR/brew.sh"
sketchybar --set brew icon=􀐛
sketchybar --set brew icon.font="$FONT:Black:12.0"
sketchybar --set brew label=?
sketchybar --set brew background.padding_right=15
sketchybar --set brew --subscribe brew brew_update
