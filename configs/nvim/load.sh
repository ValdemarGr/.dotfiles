#!/bin/bash
mkdir -p ~/.config/nvim
cp *.vim ~/.config/nvim
cp *.json ~/.config/nvim
rm -rf ~/.config/nvim/lua
cp -r lua ~/.config/nvim
cp .taskrc ~
mkdir -p ~/.config/bugwarrior
cp bugwarriorrc ~/.config/bugwarrior
