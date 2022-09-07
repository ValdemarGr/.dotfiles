syntax on

runtime plugins.vim

let g:gruvbox_termcolors = 256
set background=dark
let g:gruvbox_contrast_dark='hard'
" colorscheme gruvbox
colorscheme gruvbox-baby
highlight Pmenu ctermbg=black guibg=#222222
" colorscheme one
" colorscheme onedark

runtime config.vim

function Reload ()
    exec '!cd ' . $DOTFILES . '/configs/nvim && bash load.sh'
    source ~/.config/nvim/plugins.vim 
    source ~/.config/nvim/config.vim 
endfunction
command Reload call Reload()

function PushDot ()
    silent exec '!git -C ' . $DOTFILES . ' add .'
    silent exec '!git -C ' . $DOTFILES . ' commit -m "dotfiles update"'
    silent exec '!git -C ' . $DOTFILES . ' push'
endfunction
command PushDot call PushDot()

