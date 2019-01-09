#
# ~/.bashrc
#
export PATH=$PATH:$HOME/.gem/ruby/2.5.0/bin
export PRIMARY_MONITOR=DP-4
export PATH=$PATH:$HOME/Git/.dotfiles/Scripts

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

source $HOME/anaconda3/etc/profile.d/conda.sh

conda activate arch

#alias python=/home/valde/anaconda3/envs/arch/bin/python
#alias python3=/home/valde/anaconda3/envs/arch/bin/python3


