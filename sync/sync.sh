#!/bin/bash
sed 's/REPO/'"$1"'/g' lsyncd.lua | sed 's/TARGET_DIR/'"$2"'/g' > /tmp/lsync.temp.lua
cat /tmp/lsync.temp.lua
lsyncd -log all /tmp/lsync.temp.lua
