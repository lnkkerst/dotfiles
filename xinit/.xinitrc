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
source $HOME/.xprofile

## multi display support
EXTRA_MONITOR=$(xrandr -d $DISPLAY -q | grep ' connected' | awk '{print $1}' | grep -v '^eDP')

if [ -n "$EXTRA_MONITOR" ]; then
  export ROFI_DPI=96
  export XCURSOR_SIZE=24

  xrandr --output eDP --mode 1440x900 --pos 2560x540 --rotate normal --output ${EXTRA_MONITOR} --primary --mode 2560x1440 --pos 0x0 --rotate normal --rate 120
  # if [ "$EXTRA_MONITOR_NAME" == "27" ]; then
  #   xrandr --output eDP --mode 1440x900 --pos 2560x540 --rotate normal --output ${EXTRA_MONITOR} --primary --mode 2560x1440 --pos 0x0 --rotate normal --rate 120
  # else
  #   xrandr --output eDP --mode 1440x900 --pos 1920x180 --rotate normal --output ${EXTRA_MONITOR} --primary --mode 1920x1080 --pos 0x0 --rotate normal --rate 165
  # fi
else
  echo "Xft.dpi: 192" | xrdb -merge
  export GDK_SCALE=2
  export GDK_DPI_SCALE=0.5
  export ROFI_DPI=192
  export XCURSOR_SIZE=48
  xrandr --output HDMI-1 --off --output eDP-1 --primary --mode 2240x1400 --pos 0x0 --rotate normal --output DP-1 --off --output DP-2 --off
fi

# autostart

# start wm
export DESKTOP_SESSION=bspwm
export XDG_CURRENT_DESKTOP=bspwm
exec bspwm
