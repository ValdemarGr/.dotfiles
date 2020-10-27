#!/bin/bash
if ! command -v nvim &> /dev/null
then
	echo "Please install nvim"
	exit
fi

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

curl -LO https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep_11.0.2_amd64.deb
sudo dpkg -i ripgrep_11.0.2_amd64.deb
rm ripgrep_11.0.2_amd64.deb

DIR=$(pwd)
mkdir -p /tmp/tflsp
cd /tmp/tflsp
curl -LO https://github.com/juliosueiras/terraform-lsp/releases/download/v0.0.11-beta2/terraform-lsp_0.0.11-beta2_linux_amd64.tar.gz
tar -xvzf terraform-lsp_0.0.11-beta2_linux_amd64.tar.gz
sudo mv /tmp/tflsp/terraform-lsp /usr/local/bin

curl -LO https://github.com/sharkdp/bat/releases/download/v0.16.0/bat_0.16.0_amd64.deb
mkdir -p /tmp/bat
mv bat_0.16.0_amd64.deb /tmp/bat
sudo dpkg -i /tmp/bat/bat_0.16.0_amd64.deb

