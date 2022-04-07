#! /bin/fish

# Terminate already running bar instances
killall -q polybar

# Launch
# polybar -c $HOME/.config/bspwm/polybar/config.ini bspwm &
# polybar -c $HOME/.config/bspwm/polybar/config.ini mpd &
# polybar -c $HOME/.config/bspwm/polybar/config.ini tray &
polybar -c $HOME/.config/bspwm/polybar/config.ini full &

echo "Bars launched..."
