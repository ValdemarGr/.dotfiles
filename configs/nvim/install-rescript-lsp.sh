#!/bin/bash
rm -rf /tmp/rescriptlsp
rm -rf $HOME/rescriptlsp

mkdir -p /tmp/rescriptlsp
mkdir -p $HOME/rescriptlsp
curl https://github.com/rescript-lang/rescript-vscode/releases/download/1.1.2/rescript-vscode-1.1.2.vsix -L -o /tmp/rescriptlsp/rescriptlsp.vsix
cd $HOME/rescriptlsp
cd /tmp/rescriptlsp && unzip rescriptlsp.vsix
mv /tmp/rescriptlsp/extension/server $HOME/rescriptlsp
