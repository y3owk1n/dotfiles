#!/bin/sh

zen_on() {
	sketchybar  --set github.bell drawing=off
	sketchybar	--set apple.logo drawing=off
	sketchybar	--set '/cpu.*/' drawing=off
	sketchybar	--set calendar icon.drawing=off
	sketchybar	--set system.yabai drawing=off
	sketchybar	--set separator drawing=off
	sketchybar	--set front_app drawing=off
	sketchybar	--set volume_alias drawing=off
	sketchybar	--set spotify.anchor drawing=off
	sketchybar	--set spotify.play updates=off
	sketchybar	--set brew drawing=off
	sketchybar	--set divider drawing=off
	sketchybar	--bar padding_left=18
}

zen_off() {
	sketchybar  --set github.bell drawing=on
	sketchybar	--set apple.logo drawing=on
	sketchybar	--set '/cpu.*/' drawing=on
	sketchybar	--set calendar icon.drawing=on
	sketchybar	--set separator drawing=on
	sketchybar	--set front_app drawing=on
	sketchybar	--set system.yabai drawing=on
	sketchybar	--set volume_alias drawing=on
	sketchybar	--set spotify.play updates=on
	sketchybar	--set brew drawing=on
	sketchybar	--set divider drawing=on
	sketchybar	--bar padding_left=7
}

if [ "$1" = "on" ]; then
	zen_on
elif [ "$1" = "off" ]; then
	zen_off
else
	if [ "$(sketchybar --query apple.logo | jq -r ".geometry.drawing")" = "on" ]; then
		zen_on
	else
		zen_off
	fi
fi
