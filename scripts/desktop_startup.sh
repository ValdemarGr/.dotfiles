#!/bin/bash

#bash set_desktop_monitors.sh
nvidia-settings &
sleep 3
killall -9 nvidia-settings
bash wallpaper_random.sh

