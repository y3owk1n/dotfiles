#!/usr/bin/env sh

sketchybar --add item graph.container right
sketchybar --set graph.container label.width=150
sketchybar --set graph.container label.font="$FONT:Semibold:7"
sketchybar --set graph.container label.background.drawing=off
sketchybar --set graph.container label.background.height=24
sketchybar --set graph.container y_offset=0
sketchybar --set graph.container label.background.color=$BACKGROUND_1
sketchybar --set graph.container label.background.corner_radius=9
sketchybar --set graph.container background.padding_left=-170

sketchybar --add item cpu.top right
sketchybar --set cpu.top label.font="$FONT:Semibold:7"
sketchybar --set cpu.top label=CPU
sketchybar --set cpu.top icon.drawing=off
sketchybar --set cpu.top width=0
sketchybar --set cpu.top y_offset=6
sketchybar --set cpu.top label.padding_right=4
sketchybar --set cpu.top background.padding_right=23

sketchybar --add item cpu.percent right
sketchybar --set cpu.percent label.font="$FONT:Heavy:10"
sketchybar --set cpu.percent label=CPU
sketchybar --set cpu.percent y_offset=-5
sketchybar --set cpu.percent width=35
sketchybar --set cpu.percent icon.drawing=off
sketchybar --set cpu.percent update_freq=2
sketchybar --set cpu.percent mach_helper="$HELPER"
sketchybar --set cpu.percent background.padding_right=20

sketchybar --add graph cpu.sys right 100
sketchybar --set cpu.sys width=0
sketchybar --set cpu.sys graph.color=$RED
sketchybar --set cpu.sys graph.fill_color=$RED
sketchybar --set cpu.sys label.drawing=off
sketchybar --set cpu.sys icon.drawing=off
sketchybar --set cpu.sys y_offset=2
sketchybar --set cpu.sys background.padding_right=20
sketchybar --set cpu.sys background.padding_left=10
sketchybar --set cpu.sys background.height=20
sketchybar --set cpu.sys background.drawing=on
sketchybar --set cpu.sys background.color=$TRANSPARENT

sketchybar --add graph cpu.user right 100
sketchybar --set cpu.user graph.color=$BLUE
sketchybar --set cpu.user label.drawing=off
sketchybar --set cpu.user icon.drawing=off
sketchybar --set cpu.user y_offset=2
sketchybar --set cpu.user background.padding_right=20
sketchybar --set cpu.user background.padding_left=10
sketchybar --set cpu.user background.height=20
sketchybar --set cpu.user background.drawing=on
sketchybar --set cpu.user background.color=$TRANSPARENT
