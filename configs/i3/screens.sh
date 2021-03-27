#!/bin/sh
sleep 2
nvidia-settings &
xrandr --output DVI-D-0 --off --output HDMI-0 --off --output DP-5 --off --output DP-4 --primary --mode 3440x1440 --pos 3440x0 --rotate normal --output DP-3 --off --output DP-2 --mode 1920x1080 --pos 6880x360 --rotate normal --output DP-1 --off --output DP-0 --mode 3440x1440 --pos 0x0 --rotate normal
sleep 2
killall -9 nvidia-settings
bash ~/Git/.dotfiles/configs/polybar/launch.sh
picom &
bash ~/Git/.dotfiles/configs/i3/wp.sh
