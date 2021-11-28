#!/bin/bash
cp -r .emacs.d ~
cp emacs.service ~/.config/systemd/user/emacs.service
systemctl enable --user emacs
systemctl start --user emacs
cp emacsclient.desktop ~/.local/share/applications
