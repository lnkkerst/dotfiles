#! /bin/fish

# Terminate already running bar instances
killall -q polybar

if test $DOUBLE_MONITOR = 1
    polybar DP &
    polybar eDP &
else
    polybar single &
end
echo "Bars launched..."
