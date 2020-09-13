#!/bin/bash

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload left &
    MONITOR=$m polybar --reload center &
    MONITOR=$m polybar --reload right &
    MONITOR=$m polybar --reload back &
  done
  #MONITOR=$m polybar --reload bottom &
else
    MONITOR=$m polybar --reload back &
    MONITOR=$m polybar --reload left &
    MONITOR=$m polybar --reload center &
    MONITOR=$m polybar --reload right &
fi

