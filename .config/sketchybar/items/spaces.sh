#!/usr/bin/env sh

SPACE_ICONS=("1" "2" "3" "4" "5" "6")

sid=0
for i in "${!SPACE_ICONS[@]}"
do
    sid=$(($i+1))
    sketchybar --add space space.$sid left
    sketchybar --set space.$sid associated_space=$sid
    sketchybar --set space.$sid icon=${SPACE_ICONS[i]}
    sketchybar --set space.$sid icon.padding_left=10
    sketchybar --set space.$sid icon.padding_right=10
    sketchybar --set space.$sid icon.highlight_color=$ORANGE
    sketchybar --set space.$sid background.padding_left=-8
    sketchybar --set space.$sid background.padding_right=-8
    sketchybar --set space.$sid background.color=$BACKGROUND_1
    sketchybar --set space.$sid background.drawing=on
    sketchybar --set space.$sid script="$PLUGIN_DIR/space.sh"
done

sketchybar --add item separator left
sketchybar --set separator icon=
sketchybar --set separator icon.font="Hack Nerd Font:Regular:12.0"
sketchybar --set separator background.padding_left=16
sketchybar --set separator background.padding_right=0
sketchybar --set separator label.drawing=off
sketchybar --set separator associated_display=active
sketchybar --set separator icon.color=$WHITE
