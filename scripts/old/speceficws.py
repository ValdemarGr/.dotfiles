import argparse
import i3ipc
import re

parser = argparse.ArgumentParser(description='Window as dict')
parser.add_argument('--w', metavar='N', type=int, help='The window (integer)', required=True)
parser.add_argument('--cmd', metavar='N', type=str, help='Command', required=True)

parsed = parser.parse_args()

if parsed.w is None or parsed.cmd is None:
    parser.print_help()
    exit()

num = parsed.w
cmd = parsed.cmd

i3 = i3ipc.Connection()

wss = i3.get_workspaces()
for ws in wss:
    n = ws['name']
    p = re.search('^\s*[0-9]', n).group(0)

    if p.isdigit():
        if int(p) == num:
            i3.command(cmd.replace('\\s', n))
            exit()

i3.command(f'workspace {num}: new')
