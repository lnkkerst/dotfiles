#!/bin/bash

wofi_command="wofi --dmenu"

#### Options ###
shutdown=Shutdown
reboot=Reboot
lock=Lock
suspend=Suspend
logout=Logout

options="$shutdown\n$reboot\n$lock\n$suspend\n$logout"

chosen="$(echo -e "$options" | $wofi_command)"
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
