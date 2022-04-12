#! /bin/fish

set shutdown 
set reboot 
set lock 
set suspend 鈴
set logout 
set opt (echo "$shutdown
$reboot
$lock
$suspend
$logout" | rofi -theme $HOME/.config/bspwm/scripts/rofi/material.rasi -p "Uptime: $(uptime -p | sed -e 's/up //g')" -dmenu -selected-row 2)

switch $opt
    case $shutdown
        systemctl poweroff
    case $reboot
        systemctl reboot
    case $lock
        sleep 0.3; bash $HOME/.config/i3/i3lock-color.sh
    case $suspend
        systemctl suspend
    case $logout
        bspc quit
end
