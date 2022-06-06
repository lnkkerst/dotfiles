#! /bin/fish

# Terminate already running bar instances
killall -q polybar

if test $DOUBLE_MONITOR = 1
    polybar DP --config=$HOME/.config/polybar/config.ini &
    polybar eDP --config=$HOME/.config/polybar/config.ini &
else
    polybar single --config=$HOME/.config/polybar/config.ini &
end
echo "Bars launched..."
