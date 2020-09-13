#!/bin/bash
FILE=/tmp/windowserver
if test -f "$FILE"; then
    kill -9 $(cat $FILE)
    rm $FILE
fi
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
python3 $DIR/windowserver.py $1