#!/bin/bash
set -e

FONT_DIR=$HOME/.fonts
mkdir -p $FONT_DIR
cp * $FONT_DIR
fc-cache