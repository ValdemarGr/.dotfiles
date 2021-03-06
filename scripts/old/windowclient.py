import tkinter as tk
import sys
import socket

#sockpath = sys.argv[1]
port = sys.argv[1]

#sd = socket.socket(socket.AF_UNIX)
sd = socket.socket()
#sd.connect(sockpath)
sd.connect(('127.0.0.1', int(port)))

root = tk.Tk()

constanttxt = tk.Label(root, text="  Enter g, m or r  ")
constanttxt.pack()

commandmodev = tk.StringVar()
commandmodev.set("")
commandmodel= tk.Label(root, textvariable=commandmodev)
commandmodel.pack()

def endprog():
    sd.close()
    root.destroy()
    exit()

if len(sys.argv) == 4:
    argin = sys.argv[2]
    fastcall = sys.argv[3]
    sd.send(str(f"{argin},{fastcall}").encode())
    exit()

if len(sys.argv) == 3:
    argin = sys.argv[2]
    commandmodev.set(argin)


v = tk.StringVar()
v.set("")
T = tk.Label(root, textvariable=v)
T.pack()


frame = tk.Frame(root)

def key(event):
    c = repr(event.char)[1]

    if '\\' in c:
        endprog()
    if '\'' in c:
        endprog()

    if len(commandmodev.get()) == 0:
        if 'g' in c:
            commandmodev.set("goto")
        if 'm' in c:
            commandmodev.set("move")
        if 'r' in c:
            commandmodev.set("rename")
        return

    v.set(v.get() + c)

def confirm(event):
    sd.send(str(commandmodev.get() + "ws" + "," + v.get()).encode())
    endprog()

frame.bind("<Key>", key)
frame.bind("<Return>", confirm)
frame.pack()

frame.focus_set()

root.attributes('-type', 'dialog')
root.mainloop()
