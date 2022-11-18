# sketchybar --add item volume right
# sketchybar --set volume script="$PLUGIN_DIR/volume.sh"
# sketchybar --set volume updates=on
# sketchybar --set volume icon.background.drawing=on
# sketchybar --set volume icon.background.color=$BLUE
# sketchybar --set volume icon.background.height=8
# sketchybar --set volume icon.background.corner_radius=3
# sketchybar --set volume icon.padding_left=8
# sketchybar --set volume icon.width=0
# sketchybar --set volume icon.align=right
# sketchybar --set volume label.drawing=off
# sketchybar --set volume background.drawing=on
# sketchybar --set volume background.color=$BACKGROUND_2
# sketchybar --set volume background.height=8
# sketchybar --set volume background.corner_radius=3
# sketchybar --set volume align=left
# sketchybar --subscribe volume volume_change

sketchybar --add alias "Control Centre,Sound" right
sketchybar --rename "Control Centre,Sound" volume_alias
sketchybar --set volume_alias alias.color=$BLACK
sketchybar --set volume_alias icon.drawing=off
sketchybar --set volume_alias icon.padding_left=8
sketchybar --set volume_alias icon.padding_right=8
sketchybar --set volume_alias label.drawing=off
sketchybar --set volume_alias label.padding_left=8
sketchybar --set volume_alias label.padding_right=8
sketchybar --set volume_alias background.height=24
sketchybar --set volume_alias background.color=$ORANGE
sketchybar --set volume_alias click_script="$PLUGIN_DIR/volume_click.sh"
