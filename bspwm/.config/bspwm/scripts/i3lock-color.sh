#!/bin/sh

BLANK='#5a5f78'
CLEAR='#303446'
DEFAULT='#303446'
TEXT='#c5cff5'
WRONG='#f38ba8'
VERIFYING='#87b0f9'

i3lock \
  --insidever-color=$CLEAR \
  --ringver-color=$VERIFYING \
  --insidewrong-color=$CLEAR \
  --ringwrong-color=$WRONG \
  --inside-color=$BLANK \
  --ring-color=$DEFAULT \
  --line-color=$BLANK \
  --separator-color=$DEFAULT \
  --verif-color=$TEXT \
  --wrong-color=$TEXT \
  --time-color=$TEXT \
  --date-color=$TEXT \
  --layout-color=$TEXT \
  --keyhl-color=$WRONG \
  --bshl-color=$WRONG \
  --screen 1 \
  --blur 5 \
  --clock \
  --indicator \
  --time-str="%H:%M:%S" \
  --date-str="%A, %m %Y" \
  --keylayout 1
