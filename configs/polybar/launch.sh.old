#!/bin/bash

if pgrep polybar; then killall -9 polybar; fi

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
    echo "desktop";
fi

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload center &
    MONITOR=$m polybar --reload back &
  done
  MONITOR=$PRIMARY_MONITOR polybar --reload left &
  MONITOR=$PRIMARY_MONITOR polybar --reload tray &
  MONITOR=$PRIMARY_MONITOR polybar --reload right &
else
    MONITOR=$m polybar --reload back &
    MONITOR=$m polybar --reload left &
    MONITOR=$m polybar --reload center &
    MONITOR=$m polybar --reload right &
fi

