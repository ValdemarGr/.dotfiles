#!/bin/bash

files=(
    #msg, dir, savedir, activated
    ("i3 config found, want to export it [y/n]?" "~/.config/i3/config" "./i3/config" false)
)

for trial in "${files[@]}"
do
    echo "${trial[1]}"
done

if [ -e ~/.config/i3/config ]
then
    echo "i3 config found, want to export it [y/n]?"
    read import_i3
    if  [ "$import_i3" = "y" ]
    then
        echo "importing i3 config"
    fi
else
    echo "i3 config not found"
fi


