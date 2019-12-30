from shutil import copyfile
from distutils.dir_util import copy_tree
import os

from configuration_files import CONFIGUARTION_FILES, MESSAGE, LOCAL_DIRECTORY, SAVE_DIRECTORY, IS_DIR

configurationfiles = CONFIGUARTION_FILES

chosen = []

yes_to_all = False

for cfg in configurationfiles:
    def loadStuff():
        chosen.append([f"loading {cfg[MESSAGE]}", cfg[LOCAL_DIRECTORY], cfg[SAVE_DIRECTORY], cfg[IS_DIR]])

    if yes_to_all == True:
        loadStuff()
        continue

    print(f'{cfg[MESSAGE]} found \n' +
        f'at autosave directory {cfg[SAVE_DIRECTORY]}\n' +
        f'will be loaded to local directory {cfg[LOCAL_DIRECTORY]}')
    print(cfg[MESSAGE] + ", found, want to import it [y/n/a]?")
    answer = str(input())

    if answer == "a":
        yes_to_all = True
        loadStuff()

    if answer == "y":
        loadStuff()

for choice in chosen:
    print(choice[MESSAGE])
    outdir = os.path.expanduser(choice[LOCAL_DIRECTORY])
    
    if cfg[IS_DIR] == True:
        copy_tree(os.path.expanduser(choice[SAVE_DIRECTORY]), outdir)
    else:
        if not os.path.exists(outdir):
            os.mkdir(os.path.dirname(outdir))

        copyfile(os.path.expanduser(choice[SAVE_DIRECTORY]), outdir)


