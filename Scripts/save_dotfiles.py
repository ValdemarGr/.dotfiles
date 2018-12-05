from enum import Enum
from shutil import copyfile
import os

MESSAGE = 0
DIRECTORY = 1
SAVE_DIRECTORY = 2


configurationfiles = [
    ["i3 config", "~/.config/i3/config", "/i3/config",],
    ["Xdefaults (urxvt theme)", "~/.Xdefaults", "/urxvt/.Xdefaults"],
    ["polybar config",  "~/.config/polybar/config", "/polybar/config"],
    ["zshrc",  "~/.zshrc", "/zsh/.zshrc"],
    ["bashrc",  "~/.bashrc", "/bash/.bashrc"],
]

chosen = []

for cfg in configurationfiles:
    print(cfg[MESSAGE] + ", found, want to export it [y/n]?")
    answer = str(input())

    if answer == "y":
        chosen.append([f"saving {cfg[MESSAGE]}", cfg[DIRECTORY], cfg[SAVE_DIRECTORY]])

print(f"Are you sure you want to copy all the chosen files to directory {os.getcwd()} [y/n]?")
final_answer = str(input())

if final_answer == "y":
    for choice in chosen:
        print(choice[MESSAGE])
        outdir = os.getcwd()  + os.path.expanduser(choice[SAVE_DIRECTORY])

        if not os.path.exists(outdir):
            os.mkdir(os.path.dirname(outdir))

        copyfile(os.path.expanduser(choice[DIRECTORY]), outdir)

else:
    print("Goodbye")
    exit(0)
