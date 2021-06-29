#!/bin/bash
mkdir -p ~/.config/nvim
cp *.vim ~/.config/nvim
rm -rf ~/.config/nvim/lua
cp -r lua ~/.config/nvim
