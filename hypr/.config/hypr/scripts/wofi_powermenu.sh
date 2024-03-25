#!/bin/bash

wofi_command="wofi --dmenu"

#### Options ###
shutdown=Shutdown
reboot=Reboot
lock=Lock
suspend=Suspend
logout=Logout
hibernate=Hibernate

options="$shutdown\n$reboot\n$lock\n$suspend\n$logout\n$hibernate"

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
  systemctl suspend
  ;;
$hibernate)
  systemctl hibernate
  ;;
$logout)
  hyprctl dispatch exit ""
  ;;
esac
