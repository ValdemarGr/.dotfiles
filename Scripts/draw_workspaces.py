import os
import i3ipc
import screeninfo
import re
from subprocess import PIPE, run

i3 = i3ipc.Connection()

regex = r'\+[0-9]+\+'

command = ["xrandr"]
result = run(command, stdout=PIPE, stderr=PIPE, universal_newlines=True)
out = result.stdout

monitors = {}

for line in out.split("\n"):
    if re.search(" connected ", line):
        monitors[line.split(" ")[0]] = [re.search(regex, line).group(0)[1:-1]]
       



for ws in i3.get_workspaces():
    monitors[ws.output].append(ws.name)

monitors

def sortfnc(kv):
    k, v = kv
    return int(v[0])

for k,v in sorted(monitors.items(), key=sortfnc):
    builder = ""
    v = v[1:]
    for x in v:
        builder = builder + str(x) + " | "
    print(k + " →",  builder[:-3])

#"command = ["grep",  " connected ", "|", "awk", '{ print$1;print$3 }']
