syntax on

runtime plugins.vim

let g:gruvbox_termcolors = 256
set background=dark
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox
" colorscheme one
" colorscheme onedark

runtime config.vim

function Reload ()
    exec '!cd ' . $DOTFILES . '/configs/nvim && bash load.sh'
    source ~/.config/nvim/plugins.vim 
    source ~/.config/nvim/config.vim 
endfunction
command Reload call Reload()
