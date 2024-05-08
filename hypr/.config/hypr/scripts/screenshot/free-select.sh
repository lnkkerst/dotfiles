#!/usr/bin/env sh

pic_file=$(date +"$HOME/Pictures/grim/%Y-%m-%d-%H%M%S-%s.png")

grim -g "$(slurp)" $pic_file

cat $pic_file | wl-copy

notify-send "Screenshot has sent to clipboard"
