#!/bin/bash

port=$1
cmd=$2
arg=$3

case "$cmd" in
    ("goto")    printf "gotows,$arg" | nc 127.0.0.1 $port ;;
    ("rename")  printf "renamews,$arg" | nc 127.0.0.1 $port ;;
    ("move")    printf "movews,$arg" | nc 127.0.0.1 $port ;;
    ("icon")    printf "iconws,$arg" | nc 127.0.0.1 $port ;;
esac