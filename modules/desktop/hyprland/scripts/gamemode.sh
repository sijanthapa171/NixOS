#!/usr/bin/env bash
# HYPRGAMEMODE=$(hyprctl getoption animations:enabled | sed -n '2p' | awk '{print $2}')
HYPRGAMEMODE=$(hyprctl getoption animations:enabled | sed -n '1p' | awk '{print $2}')

if [ $HYPRGAMEMODE = 1 ]; then
  hyprctl -q --batch "\
        keyword animations:enabled 0;\
        keyword decoration:shadow:enabled 0;\
        keyword decoration:drop_shadow 0;\
        keyword decoration:blur:enabled 0;\
        keyword decoration:blur:xray 1;\
        keyword general:gaps_in 0;\
        keyword general:gaps_out 0;\
        keyword general:border_size 1;\
        keyword decoration:rounding 0;\
        keyword decoration:active_opacity 1 ;\
        keyword decoration:inactive_opacity 1 ;\
        keyword decoration:fullscreen_opacity 1 ;\
        keyword layerrule noanim,waybar ;\
        keyword layerrule noanim,swaync-notification-window ;\
        keyword layerrule noanim,swww-daemon ;\
        keyword layerrule noanim,rofi"
  hyprctl 'keyword windowrule opaque,class:(.*)' # ensure all windows are opaque
  exit
else
  hyprctl reload config-only -q
fi
