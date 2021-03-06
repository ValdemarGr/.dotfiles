from shutil import copyfile, copytree, copy
from distutils.dir_util import copy_tree
import os

from configuration_files import CONFIGUARTION_FILES, MESSAGE, LOCAL_DIRECTORY, SAVE_DIRECTORY, IS_DIR

configurationfiles = CONFIGUARTION_FILES

chosen = []

yes_to_all = False

for cfg in configurationfiles:
    def saveStuff():
        chosen.append([f"saving {cfg[MESSAGE]}", cfg[LOCAL_DIRECTORY], cfg[SAVE_DIRECTORY], cfg[IS_DIR]])

    if yes_to_all == True:
        saveStuff()
        continue

    print(f'{cfg[MESSAGE]} found \n' +
        f'at local directory {cfg[LOCAL_DIRECTORY]}\n' +
        f'will be saved at directory {cfg[SAVE_DIRECTORY]}')
    print(cfg[MESSAGE] + ", found, want to export it [y/n/a]?")
    answer = str(input())

    if answer == "a":
        yes_to_all = True
        saveStuff()

    if answer == "y":
        saveStuff()

for choice in chosen:
    print(choice[MESSAGE])
    outdir = os.path.expanduser(choice[SAVE_DIRECTORY])

    if choice[IS_DIR] == True:
        copy_tree(os.path.expanduser(choice[LOCAL_DIRECTORY]), outdir)
    else:

        if not os.path.exists(outdir):
            os.makedirs(os.path.dirname(outdir))


        copyfile(os.path.expanduser(choice[LOCAL_DIRECTORY]), outdir)

