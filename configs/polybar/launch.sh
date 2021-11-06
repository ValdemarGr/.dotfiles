#!/bin/bash

if pgrep polybar; then killall -9 polybar; fi

if xrandr --query | grep " connected" | cut -d" " -f1 | grep "^HDMI-0$"
then
    PRIMARY_MONITOR=DP-2
else
    if xrandr --query | grep " connected" | cut -d" " -f1 | grep "^eDP-1$"
    then
        echo "lap";
        if xrandr --query | grep " connected" | cut -d" " -f1 | grep "^DP-1$"
        then
            PRIMARY_MONITOR=DP-1
        else
            PRIMARY_MONITOR=eDP-1
        fi
    else
        PRIMARY_MONITOR=DP-4
        echo "desktop";
    fi
fi
echo "running with $PRIMARY_MONITOR as primary"

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    if [ "$m" == "$PRIMARY_MONITOR" ]; then
      MONITOR=$m polybar --reload main &
    else
      MONITOR=$m polybar --reload wms &
    fi
  done
else
  MONITOR=$PRIMARY_MONITOR polybar --reload main &
fi

