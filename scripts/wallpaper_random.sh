#!/bin/bash



wp="$(ls -p ~/Git/.dotfiles/wp | grep -v / | shuf -n 1)"

feh --bg-scale "$HOME/Git/.dotfiles/wp/$wp"

