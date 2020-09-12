#!/bin/bash
set -e

sudo apt-get install -y \
  cmake cmake-data libcairo2-dev libxcb1-dev libxcb-ewmh-dev \
  libxcb-icccm4-dev libxcb-image0-dev libxcb-randr0-dev \
  libxcb-util0-dev libxcb-xkb-dev pkg-config python-xcbgen \
  xcb-proto libxcb-xrm-dev libasound2-dev libmpdclient-dev \
  libiw-dev libcurl4-openssl-dev libpulse-dev \
  libxcb-composite0-dev xcb libxcb-ewmh2
cd /tmp
rm -rf polybar
git clone https://github.com/jaagr/polybar.git
cd polybar
git checkout 3.4.3
echo -e "\e[31m!!!!!!!!!!!!!!!!!\e[0m"
echo "During the build process answer Yes to all the options (except the first on on using GCC instead of CLang if available)."
echo -e "\e[31m!!!!!!!!!!!!!!!!!\e[0m"
sleep 4
./build.sh