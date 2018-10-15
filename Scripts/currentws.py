import i3ipc
import sys

'''
i3 = i3ipc.Connection()
focus = i3.get_tree().find_focused().workspace()

cmd = sys.argv[1]
elements = sys.argv[2:]

xs = []
for e in elements:
    if "focus=" in e:
        xs.append(str(vars(focus)[e.replace("focus=", "")]))
        continue
    if "format=" in e:
        if "wsname" in e:
            try:
                xs[:-1] = xs[: xs[:-1].index(':') + 1]
            except ValueError:
                print(xs[0])
                xs[0] = xs[0][: xs[0].index(':') + 1]
            continue

    xs.append(e)

# hackhack
if elements.find("action=input"):
    out = ""

i3.command((cmd.replace("%r", "%s")) % tuple(xs))'''

i3 = i3ipc.Connection()
focus = i3.get_tree().find_focused().workspace()

newname = sys.argv[1]
prefix = newname[: newname.index(':') + 1]

i3.command(f"rename workspace to %{prefix + newname}")
