import i3ipc
import sys
import re
import argparse
import socket
import os
import tkinter as tk

sockdir = sys.argv[1]

while True:
    try:

        try:
            os.remove(sockdir) 
        except:
            pass

        i3 = i3ipc.Connection()

        sd = socket.socket(socket.AF_UNIX)
        sd.bind(sockdir)
        sd.listen()

        def handle_command(items):
            cmd = items[0]
            args = items[1:]

            if "renamews" in cmd:
                focus = i3.get_tree().find_focused().workspace()
                newname = args[0]
                prefix = focus.name[: focus.name.index(':') + 1]
                final = prefix + " " + newname
                i3.command(f"rename workspace to \"{final}\"")

            if "gotows" in cmd:
                num = int(args[0])
                wss = i3.get_workspaces()
                for ws in wss:
                    n = ws['name']
                    p = re.search('^\s*[0-9]', n).group(0)
                    if p.isdigit() and int(p) == num:
                        i3.command(f"workspace {n}")
                        return
                i3.command(f'workspace "{num}: n"')
            
            if "movews" in cmd:
                num = int(args[0])
                wss = i3.get_workspaces()
                for ws in wss:
                    n = ws['name']
                    p = re.search('^\s*[0-9]', n).group(0)
                    if p.isdigit() and int(p) == num:
                        i3.command(f"move container to workspace {n}")
                        return
                i3.command(f'move container to workspace "{num}: n"')
                


        while True:
            try:
                (client,addr) = sd.accept()
                d = client.recv(1024)
                formatted_input = (str(d)[2:-1]).split(',')
                print(formatted_input)
                client.close()

                handle_command(formatted_input)

            except:
                pass

        sd.shutdown(socket.SHUT_RDWR)
        sd.close()
    except:
        pass