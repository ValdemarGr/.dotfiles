import i3ipc
import sys
import re
import socket
import os
import threading
import psutil
import subprocess

port = sys.argv[1]

sd = socket.socket()
sd.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)

pid = str(os.getpid())
f = open('/tmp/windowserver', 'w')
f.write(pid)
f.close()

POLY_RUNNING = False


zenpad_name = 'zenpad'
zenpad_toggle = False

try:

    sd.bind(('127.0.0.1',  int(port)))
    sd.settimeout(None)
    sd.listen()

    def refocus(i3):
        for node in i3.get_tree().find_focused().workspace().nodes:
            i3.command(f"[name={node.name}] focus")
            break

    def get_icon(name: str):
        return {
            'ff':'',
            'idea':'',
            'ts':'',
            'discord':'',
            'db': '',
            'cursor':'',
            'screw':'',
            'status':'',
            'flake':'',
            'brain':'',
            'docker':'',
            'kraken':'',
            'lit':'',
            'cat':'',
            'blob':'',
            'spotify':'',
            'term':'',
            'chrome':'',
            'remote':'',
            'git':'',
            'code':'',
            'mail':'',
            'fb':'',
            'file':'',
            'windows':'',
        }[name]

    def handle_command(items, i3):
        global zenpad_toggle

        global POLY_RUNNING
        cmd = items[0]
        args = items[1:]

        if "iconws" in cmd:
            focus = i3.get_tree().find_focused().workspace()
            newname = get_icon(args[0])
            try: 
                prefix = focus.name[: focus.name.index(':') + 1]
                final = prefix + " " + newname
                i3.command(f"rename workspace to \"{final}\"")
            except:
                i3.command(f"rename workspace to \"{focus.name}: {newname}\"")

        if "renamews" in cmd:
            focus = i3.get_tree().find_focused().workspace()
            newname = args[0]
            try: 
                prefix = focus.name[: focus.name.index(':') + 1]
                final = prefix + " " + newname
                i3.command(f"rename workspace to \"{final}\"")
            except:
                i3.command(f"rename workspace to \"{focus.name}: {newname}\"")

        if "gotows" in cmd:
            num = int(args[0])
            wss = i3.get_workspaces()
            for ws in wss:
                n = ws.__dict__['name']
                p = re.search('^\s*[0-9]*', n).group(0)
                if p.isdigit() and int(p) == num:
                    i3.command(f"workspace {n}")
                    return
            i3.command(f'workspace "{num}: n"')
        
        if "movews" in cmd:
            num = int(args[0])
            wss = i3.get_workspaces()
            for ws in wss:
                n = ws.__dict__['name']
                p = re.search('^\s*[0-9]', n).group(0)
                if p.isdigit() and int(p) == num:
                    i3.command(f"move container to workspace {n}")
                    return
            i3.command(f'move container to workspace "{num}: n"')

        if "poly" in cmd:
            PROCNAME = "polybar"

            if POLY_RUNNING == True:
                for proc in psutil.process_iter():
                    if proc.name() == PROCNAME:
                        print(proc.name())
                        proc.kill()
                POLY_RUNNING = False
            else:
                subprocess.call("bash launch_poly.sh", shell=True)
                POLY_RUNNING = True

        if "zenpad" in cmd:
            print(zenpad_toggle)
            if zenpad_toggle == True:
                i3.command(f'[instance="{zenpad_name}"] fullscreen disable; [instance="{zenpad_name}"] move scratchpad')
                zenpad_toggle = False
            else:
                i3.command(f'[instance="{zenpad_name}"] scratchpad show; [instance="{zenpad_name}"] floating disable; [instance="{zenpad_name}"] fullscreen enable')
                zenpad_toggle = True

    def handle_connection(client, address, i3):
        try:
            d = client.recv(1024)
            formatted_input = (str(d)[2:-1]).split(',')
            print(formatted_input)

            if len(formatted_input)  == 2:
                print("Handling")
                handle_command(formatted_input, i3)

            refocus(i3)
                #i3.command(f"workspace {i3.get_tree().find_focused().workspace().name}")
        except Exception as e:
            print(e)
        finally:
            client.close()
        

    while True:
        i3 = i3ipc.Connection()
        (client,addr) = sd.accept()
        client.settimeout(12)
        threading.Thread(target=handle_connection, args=(client, addr, i3)).start()

except Exception as e:
    sd.close()
    print(e)
    pass
