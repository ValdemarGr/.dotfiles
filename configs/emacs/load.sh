#!/bin/bash
cp -r .emacs.d ~
cp emacs.service ~/.config/systemd/user/emacs.service
systemctl enable --user emacs
systemctl stop --user emacs || 0
systemctl start --user emacs
cp emacsclient.desktop ~/.local/share/applications
mkdir ~/rescript
curl -L https://github.com/rescript-lang/rescript-vscode/releases/download/1.1.3/rescript-vscode-1.1.3.vsix --output ~/rescript/ext.zip
unzip ~/rescript/ext.zip -d ~/rescript
