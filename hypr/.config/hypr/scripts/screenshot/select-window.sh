#!/usr/bin/env sh

pic_file=$(date +"$HOME/Pictures/grim/%Y-%m-%d-%H%M%S-%s.png")

active_workspace=$(hyprctl activeworkspace -j | jq .id)

windows=$(hyprctl clients -j | jq -r ".[] | select(.workspace.id == $active_workspace) | \"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])\"")

grim -g "$(echo "$windows" | slurp)" $pic_file

cat $pic_file | wl-copy

notify-send "Screenshot has sent to clipboard"
