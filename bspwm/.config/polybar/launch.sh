#! /bin/sh

killall -q polybar

MONITOR_AMOUNT=$(xrandr -d :0 -q | grep ' connected' | wc -l)

if [ "$MONITOR_AMOUNT" == "2" ]; then
  polybar DP --config=$HOME/.config/polybar/config.ini &
  polybar eDP --config=$HOME/.config/polybar/config.ini &
else
  polybar single --config=$HOME/.config/polybar/config.ini &
fi

echo "Bars launched..."
