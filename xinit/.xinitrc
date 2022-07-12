#!/bin/fish

# vim:ft=fish

## general

# merge catppuccin colors
echo "*background: #1E1E2E
*foreground: #D9E0EE

! Gray
*color0: #6E6C7E
*color8: #988BA2

! Red
*color1: #F28FAD
*color9: #F28FAD

! Green
*color2: #ABE9B3
*color10: #ABE9B3

! Yellow
*color3: #FAE3B0
*color11:  #FAE3B0

! Blue
*color4: #96CDFB
*color12: #96CDFB

! Maguve
*color5: #DDB6F2
*color13: #DDB6F2

! Pink
*color6: #F5C2E7
*color14: #F5C2E7

! Whites
*color7: #C3BAC6
*color15: #D9E0EE
" | xrdb -merge

# env
set -gx QT_QPA_PLATFORMTHEME qt5ct
set -gx QT_SELECT 5
set -gx GTK_THEME materia-catppuccin
#set -gx QT_AUTO_SCREEN_SCALE_FACTOR 1

set -gx GTK_IM_MODULE fcitx
set -gx QT_IM_MODULE fcitx
set -gx XMODIFIERS "@im=fcitx"
set -gx INPUT_METHOD fcitx
set -gx SDL_IM_MODULE fcitx
set -gx GLFW_IM_MODULE ibus

set -gx XDG_DATA_DIRS $XDG_DATA_DIRS:/var/lib/flatpak/exports/share

set -gx LANG en_US.UTF-8

## multi display support
set -gx MONITOR_AMOUNT (xrandr --listmonitors | string match -rg "^Monitors: (.*)")

if test $MONITOR_AMOUNT = 1
    echo "Xft.dpi: 192" | xrdb -merge
    set -gx GDK_SCALE 2
    set -gx GDK_DPI_SCALE 0.5
    set -gx ROFI_DPI 192
    set -gx XCURSOR_SIZE 48
    set -gx TELEGRAM_SCALE 2
    xrandr --output HDMI-A-0 --off --output eDP --primary --mode 2560x1600 --pos 0x0 --rotate normal --output DisplayPort-0 --off --output DisplayPort-1 --off
else
    set -gx ROFI_DPI 96
    set -gx TELEGRAM_SCALE 1
    xrandr --output HDMI-A-0 --off --output eDP --mode 1440x900 --pos 0x540 --rotate normal --output DisplayPort-0 --primary --mode 2560x1440 --rate 120 --pos 1440x0 --rotate normal --output DisplayPort-1 --off
end

# autostart
#setxkbmap -option "caps:swapescape"

# start wm
set -gx DESKTOP_SESSION bspwm
exec dbus-launch --sh-syntax --exit-with-session --autolaunch=$(cat /var/lib/dbus/machine-id) bspwm
