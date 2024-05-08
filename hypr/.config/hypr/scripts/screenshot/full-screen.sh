#!/usr/bin/env sh

pic_file=$(date +"$HOME/Pictures/grim/%Y-%m-%d-%H%M%S-%s.png")

grim $pic_file

notify-send "Screenshot has saved to $pic_file"
