#!/usr/bin/env sh

CURRENT_WIFI="$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I)"
SSID="$(echo "$CURRENT_WIFI" | grep -o "SSID: .*" | sed 's/^SSID: //')"

if [ "$SSID" = "" ]; then
    sketchybar --set $NAME label="DC" icon=􀙈
fi

if [[ ${#SSID} -gt 10 ]]; then
    SSID=$(echo "$SSID" | cut -c 1-10)
    sketchybar --set $NAME label="$SSID"… icon=􀙇
    exit 0
fi
