#!/usr/bin/env fish

set picfile $(mktemp --suffix=.png)

grim $picfile
convert $picfile -level "0%,100%,0.9" \
    -filter Gaussian -resize 20% -define "filter:sigma=1.5" -resize 500.5% \
    -font Noto-Sans-CJK-SC -pointsize 32 -fill "#e64553" -gravity center \
    -annotate +0+160 "Dont Touch ヽ(#ﾟДﾟ)ﾉ┌┛" "$HOME/Pictures/func/locker.png" -gravity center -composite $picfile

set inside_color 1e1e2e22
set text_color cdd6f4

swaylock \
    --ignore-empty-password \
    --show-failed-attempts \
    --image $picfile \
    --font monospace \
    --indicator-radius 36 \
    --indicator-thickness 6 \
    --indicator-x-position 50 \
    --indicator-y-position 50 \
    --inside-color $inside_color \
    --inside-ver-color $inside_color \
    --inside-wrong-color $inside_color \
    --inside-clear-color $inside_color \
    --ring-color b4befe \
    --ring-ver-color cba6f7 \
    --ring-wrong-color f38ba8 \
    --ring-clear-color a6e3a1 \
    --text-color $text_color \
    --text-ver-color $text_color \
    --text-wrong-color $text_color \
    --text-clear-color $text_color \
    --text-caps-lock-color $text_color \
    --key-hl-color cba6f7 \
    --bs-hl-color eba0ac \
    --line-uses-inside \
    --daemonize

rm $picfile
