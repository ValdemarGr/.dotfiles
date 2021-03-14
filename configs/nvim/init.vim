syntax on

runtime plugins.vim

set background=dark
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox

runtime config.vim

function Reload ()
    exec '!cd ' . $DOTFILES . '/configs/nvim && bash load.sh'
    source ~/.config/nvim/plugins.vim 
    source ~/.config/nvim/config.vim 
endfunction
command Reload call Reload()
