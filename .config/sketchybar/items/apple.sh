#!/usr/bin/env sh

POPUP_OFF="sketchybar --set apple.logo popup.drawing=off"
POPUP_CLICK_SCRIPT="sketchybar --set \$NAME popup.drawing=toggle"

sketchybar  --add item  apple.logo left
sketchybar  --set apple.logo    icon=$APPLE
sketchybar  --set apple.logo    icon.font="$FONT:Black:12.0"
sketchybar  --set apple.logo    icon.color=$WHITE
sketchybar  --set apple.logo    background.padding_right=16
sketchybar  --set apple.logo    label.drawing=off
sketchybar  --set apple.logo    click_script="$POPUP_CLICK_SCRIPT"

sketchybar  --add item  apple.prefs popup.apple.logo
sketchybar  --set apple.prefs   icon=$PREFERENCES
sketchybar  --set apple.prefs   label="Preferences"
sketchybar  --set apple.prefs   click_script="open -a 'System Preferences';$POPUP_OFF"

sketchybar  --add item  apple.activity popup.apple.logo
sketchybar  --set apple.activity    icon=$ACTIVITY
sketchybar  --set apple.activity    label="Activity"
sketchybar  --set apple.activity    click_script="open -a 'Activity Monitor';$POPUP_OFF"

sketchybar  --add item  apple.lock popup.apple.logo
sketchybar  --set apple.lock    icon=$LOCK
sketchybar  --set apple.lock    label="Lock Screen"
sketchybar  --set apple.lock    click_script="pmset displaysleepnow;$POPUP_OFF"
