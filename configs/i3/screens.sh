#!/bin/sh
sleep 2
nvidia-settings &
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
  xrandr --output DVI-D-0 --off --output HDMI-0 --off --output DP-5 --off --output DP-4 --primary --mode 3440x1440 --pos 3440x0 --rotate normal --output DP-3 --off --output DP-2 --mode 1920x1080 --pos 6880x360 --rotate normal --output DP-1 --off --output DP-0 --mode 3440x1440 --pos 0x0 --rotate normal
fi
sleep 2
killall -9 nvidia-settings
bash ~/Git/.dotfiles/configs/polybar/launch.sh
picom &
bash ~/Git/.dotfiles/configs/i3/wp.sh
