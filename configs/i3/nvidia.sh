#!/bin/bash
sleep 2
nvidia-settings &
sleep 2
killall -9 nvidia-settings
