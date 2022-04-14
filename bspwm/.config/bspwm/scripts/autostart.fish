#! /bin/fish

set apps "xsettingsd
fcitx5
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1
nitrogen --restore; sleep 1; picom -b
nm-applet
clipit
blueman-applet
xidlehook --not-when-audio --not-when-fullscreen --timer 600 "$HOME/.config/i3/i3lock-color.sh"
xss-lock $HOME/.config/i3/i3lock-color.sh
libinput-gestures
$HOME/.config/bspwm/polybar/launch.fish
picom --config $HOME/.config/bspwm/picom/picom.conf -b
pgrep $HOME/.config/bspwm/scripts/bspswallow || sh $HOME/.config/bspwm/scripts/bspswallow
conky"

for app in (string split \n $apps)
    if test (ps -ef | grep "$app" | grep -v grep | wc -l) = 0
       fish -c "$app" &
    end
end
