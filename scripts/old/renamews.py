import i3ipc
import sys

i3 = i3ipc.Connection()
focus = i3.get_tree().find_focused().workspace()

newname = sys.argv[1]
prefix = focus.name[: focus.name.index(':') + 1]

final = prefix + " " + newname

i3.command(f"rename workspace to \"{final}\"")
