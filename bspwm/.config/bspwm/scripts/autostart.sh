#!/bin/bash

apps=(
  # "xsettingsd"
  "fcitx5 -d"
  "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"
  "sleep 2; nitrogen --restore; sleep 1; picom -b"
  "nm-applet"
  "clipit"
  "blueman-applet"
  "xidlehook --not-when-audio --not-when-fullscreen --timer 1200 \"$HOME/.config/bspwm/scripts/i3lock-color.sh\""
  "xss-lock $HOME/.config/bspwm/scripts/i3lock-color.sh"
  "libinput-gestures"
  "$HOME/.config/polybar/launch.sh"
  "dunst"
  "appimagelauncher appimagelauncherd"
  "sh $HOME/.config/bspwm/scripts/bspswallow"
  "flameshot"
)

for value in "${apps[@]}"; do
  isExist=$(ps -ef | grep "$value" | grep -v grep | wc -l)
  if [ $isExist == 0 ]; then
    sh -c "$value" &
  fi
done

xinput set-prop GXT7863:00\ 27C6:01E0\ Touchpad libinput\ Tapping\ Enabled 1
xinput set-prop GXT7863:00\ 27C6:01E0\ Touchpad libinput\ Accel\ Speed 0.6
xinput set-prop GXT7863:00\ 27C6:01E0\ Touchpad libinput\ Natural\ Scrolling\ Enabled 1
xinput set-prop GXT7863:00\ 27C6:01E0\ Touchpad libinput\ Scrolling\ Pixel\ Distance 20
