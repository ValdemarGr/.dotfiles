#!/bin/bash

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload top &
  done
  MONITOR=$m polybar --reload bottom &
else
  polybar --reload top &
  polybar --reload bottom &
fi

#sleep 1.5

#killall -9 polybar

#while true
  #do
    
    #sleep 0.2

