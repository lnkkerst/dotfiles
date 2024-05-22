#!/usr/bin/env sh

vid_file=$(date +"$HOME/Videos/wf-recorder/%Y-%m-%d-%H%M%S-%s.mp4")

active_workspace=$(hyprctl activeworkspace -j | jq .id)

windows=$(hyprctl clients -j | jq -r ".[] | select(.workspace.id == $active_workspace) | \"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])\"")

grim -g "$(echo "$windows" | slurp)" $vid_file

cat $vid_file | wl-copy

notify-send "Screenshot has sent to clipboard"
