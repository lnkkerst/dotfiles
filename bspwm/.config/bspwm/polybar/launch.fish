#! /bin/fish

# Terminate already running bar instances
killall -q polybar

# Launch
# polybar -c $HOME/.config/bspwm/polybar/config.ini bspwm &
# polybar -c $HOME/.config/bspwm/polybar/config.ini mpd &
# polybar -c $HOME/.config/bspwm/polybar/config.ini tray &

if test $DOUBLE_MONITOR = 1
    polybar -c $HOME/.config/bspwm/polybar/config.ini DP &
    polybar -c $HOME/.config/bspwm/polybar/config.ini eDP &
else
    polybar -c $HOME/.config/bspwm/polybar/config.ini single &
end
echo "Bars launched..."
