#!/usr/bin/env bash

VOLUME=$(osascript -e "output volume of (get volume settings)")
MUTED=$(osascript -e "output muted of (get volume settings)")

if [[ $MUTED != "false" ]] || [[ $VOLUME == "missing value" ]]; then
    ICON="􀊣"
    sketchybar -m --set $NAME icon=$ICON
    sketchybar -m --set $NAME label=""
    sketchybar --set sound label.padding_right=0
else
    case ${VOLUME} in
        100) ICON="􀊩" ;;
        9[0-9]) ICON="􀊩" ;;
        8[0-9]) ICON="􀊩" ;;
        7[0-9]) ICON="􀊧" ;;
        6[0-9]) ICON="􀊧" ;;
        5[0-9]) ICON="􀊧" ;;
        4[0-9]) ICON="􀊥" ;;
        3[0-9]) ICON="􀊥" ;;
        2[0-9]) ICON="􀊥" ;;
        1[0-9]) ICON="􀊡" ;;
        [0-9]) ICON="􀊡" ;;
        *) ICON="􀊡"
    esac
    sketchybar -m --set $NAME icon=$ICON
    sketchybar -m --set $NAME label="$VOLUME%"
    sketchybar --set sound label.padding_right=8
fi
