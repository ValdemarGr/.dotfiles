#!/bin/bash
sudo apt install rxvt-unicode

EXT_PATH=$HOME/.urxvt/ext
mkdir -p $EXT_PATH
cd $EXT_PATH
git clone https://github.com/majutsushi/urxvt-font-size.git