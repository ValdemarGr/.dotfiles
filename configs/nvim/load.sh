#!/bin/bash
mkdir -p ~/.config/nvim
cp *.vim ~/.config/nvim
cp *.sh ~/.config/nvim
rm -rf ~/.config/nvim/lua
cp -r lua ~/.config/nvim
