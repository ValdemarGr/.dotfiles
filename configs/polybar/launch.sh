#!/bin/bash

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

