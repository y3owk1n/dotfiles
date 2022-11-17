#!/usr/bin/env sh

sketchybar --add item graph.container right \
	--set graph.container label.width=150 \
	label.font="$FONT:Semibold:7" \
	label.background.drawing=off \
	label.background.height=24 \
	y_offset=0 \
	label.background.color=$BACKGROUND_1 \
	label.background.corner_radius=9 \
	background.padding_left=-170 \
	background.padding_right=10 \
	--add item cpu.top right \
	--set cpu.top label.font="$FONT:Semibold:7" \
	label=CPU \
	icon.drawing=off \
	width=0 \
	y_offset=6 \
	label.padding_right=4 \
	background.padding_right=23 \
	--add item cpu.percent right \
	--set cpu.percent label.font="$FONT:Heavy:10" \
	label=CPU \
	y_offset=-5 \
	width=35 \
	icon.drawing=off \
	update_freq=2 \
	mach_helper="$HELPER" \
	background.padding_right=20 \
	--add graph cpu.sys right 100 \
	--set cpu.sys width=0 \
	graph.color=$RED \
	graph.fill_color=$RED \
	label.drawing=off \
	icon.drawing=off \
	y_offset=2 \
	background.padding_right=20 \
	background.padding_left=10 \
	background.height=20 \
	background.drawing=on \
	background.color=$TRANSPARENT \
	--add graph cpu.user right 100 \
	--set cpu.user graph.color=$BLUE \
	label.drawing=off \
	icon.drawing=off \
	y_offset=2 \
	background.padding_right=20 \
	background.padding_left=10 \
	background.height=20 \
	background.drawing=on \
	background.color=$TRANSPARENT
