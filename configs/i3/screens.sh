#!/bin/sh
if xrandr --query | grep " connected" | cut -d" " -f1 | grep "^eDP-1$"
then
  echo "lap";
  #if xrandr --query | grep " connected" | cut -d" " -f1 | grep "^DP-1$"
  #then
      #PRIMARY_MONITOR=DP-1
  #else
      #PRIMARY_MONITOR=eDP-1
  #fi
else
  if xrandr --query | grep " connected" | cut -d" " -f1 | grep "^DisplayPort-0$"
  then
    xrandr --output DisplayPort-0 --mode 1920x1080 --pos 6880x360 --rotate normal --output DisplayPort-1 --mode 3440x1440 --pos 0x0 --rotate normal --output DisplayPort-2 --primary --mode 3440x1440 --pos 3440x0 --rotate normal --output HDMI-A-0 --off
    vibrant-cli DisplayPort-0 2
    vibrant-cli DisplayPort-1 2
    vibrant-cli DisplayPort-2 2
  else
    xrandr --output DVI-D-0 --off --output HDMI-0 --off --output DP-5 --off --output DP-4 --primary --mode 3440x1440 --pos 3440x0 --rotate normal --output DP-3 --off --output DP-2 --mode 1920x1080 --pos 6880x360 --rotate normal --output DP-1 --off --output DP-0 --mode 3440x1440 --pos 0x0 --rotate normal
  fi
fi
