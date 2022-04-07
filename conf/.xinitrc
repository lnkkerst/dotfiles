#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap
userxprofile=$HOME/.xprofile

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

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

#twm &
#xclock -geometry 50x50-1+1 &
#xterm -geometry 80x50+494+51 &
#xterm -geometry 80x20+494-0 &
#exec xterm -geometry 80x66+0+0 -name login

#if [ -f $userxprofile ]; then
#    source $userxprofile
#fi

export QT_QPA_PLATFORMTHEME=qt5ct
export QT_SELECT=5

#export QT_AUTO_SCREEN_SCALE_FACTOR=1
#export QT_DEVICE_PIXEL_RATIO=1

#export GDK_SCALE=2
#export GDK_DPI_SCALE=0.5

numlockx on
#xrandr --dpi 192

xrandr --listmonitors | grep DisplayPort

if [ $? = "0" ]; then
    source ~/.xinitrc.d/extend.sh
else
    source ~/.xinitrc.d/single.sh
fi

exec bspwm
