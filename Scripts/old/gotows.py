import i3ipc
import re
import sys

num = int(sys.argv[1])

i3 = i3ipc.Connection()

wss = i3.get_workspaces()
for ws in wss:
    n = ws['name']
    p = re.search('^\s*[0-9]', n).group(0)

    if p.isdigit():
        if int(p) == num:
            i3.command(f"workspace {n}")
            exit()

i3.command(f'workspace {num}: new')