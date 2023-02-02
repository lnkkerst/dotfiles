#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then

  xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
  xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then

  xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
  xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/?*.sh; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

## general

# env
export QT_QPA_PLATFORMTHEME=qt5ct
export QT_SELECT=5
export GTK_THEME=materia-catppuccin
#export QT_AUTO_SCREEN_SCALE_FACTOR=1
# export PULSE_LATENCY_MSEC=21

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export INPUT_METHOD=fcitx
export SDL_IM_MODULE=fcitx
export GLFW_IM_MODULE=ibus

export XDG_DATA_DIRS=$XDG_DATA_DIRS:/var/lib/flatpak/exports/share
export XDG_DATA_DIRS=$XDG_DATA_DIRS:$HOME/.nix-profile/share

export LANG=en_US.UTF-8

## multi display support
MONITOR_AMOUNT=$(xrandr -d $DISPLAY -q | grep ' connected' | wc -l)

if [ "$MONITOR_AMOUNT" == "1" ]; then
  echo "Xft.dpi: 192" | xrdb -merge
  export GDK_SCALE=2
  export GDK_DPI_SCALE=0.5
  export ROFI_DPI=192
  export XCURSOR_SIZE=48
  xrandr --output HDMI-A-0 --off --output eDP --primary --mode 2560x1600 --pos 0x0 --rotate normal --output DisplayPort-0 --off --output DisplayPort-1 --off
else
  export ROFI_DPI=96
  export XCURSOR_SIZE=24
  xrandr --output HDMI-A-0 --off --output eDP --mode 1440x900 --pos 0x540 --rotate normal --output DisplayPort-0 --primary --mode 2560x1440 --rate 120 --pos 1440x0 --rotate normal --output DisplayPort-1 --off
fi

# autostart
#setxkbmap -option "caps:swapescape"
# dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY
# start wm
export DESKTOP_SESSION=bspwm
# exec dbus-launch --sh-syntax --exit-with-session --autolaunch=$(cat /var/lib/dbus/machine-id) bspwm
# exec dbus-launch bspwm
exec bspwm
