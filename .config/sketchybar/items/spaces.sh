#!/usr/bin/env sh

SPACE_ICONS=("1" "2" "3" "4" "5" "6" "7" "8" "9" "0")
SPACE_CLICK_SCRIPT="yabai -m space --focus \$SID 2>/dev/null"

sid=0
for i in "${!SPACE_ICONS[@]}"
do
    sid=$(($i+1))
    sketchybar --add space space.$sid left
    sketchybar --set space.$sid associated_space=$sid
    sketchybar --set space.$sid icon=${SPACE_ICONS[i]}
    sketchybar --set space.$sid icon.padding_left=22
    sketchybar --set space.$sid icon.padding_right=22
    sketchybar --set space.$sid label.padding_right=33
    sketchybar --set space.$sid icon.highlight_color=$RED
    sketchybar --set space.$sid background.padding_left=-8
    sketchybar --set space.$sid background.padding_right=-8
    sketchybar --set space.$sid background.color=$BACKGROUND_1
    sketchybar --set space.$sid background.drawing=on
    sketchybar --set space.$sid label.font="sketchybar-app-font:Regular:12.0"
    sketchybar --set space.$sid label.background.height=26
    sketchybar --set space.$sid label.background.drawing=on
    sketchybar --set space.$sid label.background.color=$BACKGROUND_2
    sketchybar --set space.$sid label.background.corner_radius=9
    sketchybar --set space.$sid label.drawing=off
    sketchybar --set space.$sid script="$PLUGIN_DIR/space.sh"
    sketchybar --set space.$sid click_script="$SPACE_CLICK_SCRIPT"
done

sketchybar --add item separator left
sketchybar --set separator icon=
sketchybar --set separator icon.font="Hack Nerd Font:Regular:12.0"
sketchybar --set separator background.padding_left=20
sketchybar --set separator background.padding_right=0
sketchybar --set separator label.drawing=off
sketchybar --set separator associated_display=active
sketchybar --set separator icon.color=$WHITE
