#!bin/bash

urxvt -e 'zsh -is eval htop'
urxvt -e 'zsh -is eval htop'

i3-msg 'split v'

urxvt -e 'zsh -is eval htop'

i3-msg 'split h'
