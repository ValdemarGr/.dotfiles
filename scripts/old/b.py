import i3ipc

i3 = i3ipc.Connection()

i3.command('for_window [title="renamewd"] floating enable')