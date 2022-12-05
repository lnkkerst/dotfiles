#!/bin/bash

rofi_command="rofi -theme ~/.config/hypr/scripts/rofi/powermenu.rasi"

#### Options ###
shutdown=
reboot=""
lock=""
suspend="鈴"
logout=""

options="$shutdown\n$reboot\n$lock\n$suspend\n$logout"

chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 2)"
case $chosen in
$lock)
  fish ~/.config/hypr/scripts/swaylock.fish
  ;;
$shutdown)
  systemctl poweroff
  ;;
$reboot)
  systemctl reboot
  ;;
$suspend)
  mpc -q pause
  amixer set Master mute
  loginctl suspend
  ;;
$logout)
  hyprctl dispatch exit ""
  ;;
esac
