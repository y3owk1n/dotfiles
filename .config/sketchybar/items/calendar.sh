#!/usr/bin/env sh

sketchybar --add item     calendar right                         \
           --set calendar icon=cal                               \
                          icon.font="$FONT:Black:12.0"           \
                    background.height=24 \
                              icon.padding_left=8                    \
                              icon.padding_left=8                    \
                              label.padding_left=8                    \
                              label.padding_right=8                   \
                              background.color=$BACKGROUND_1                \
                          align=center                           \
                          click_script="$PLUGIN_DIR/zen.sh"
