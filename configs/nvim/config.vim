set scrolloff=12
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set cursorcolumn
set hidden
:set completeopt=longest,menuone

set number relativenumber
set nu rnu

set ttimeout
set ttimeoutlen=0

set colorcolumn=120
set diffopt+=vertical

let mapleader = " "
let g:vimwiki_list = [{'path': '~/Git/.dotfiles/wiki/', 'path_html':'~/Git/.dotfiles/html/'}]

autocmd TermOpen,BufWinEnter,WinEnter term://* stopinsert
autocmd BufLeave term://* stopinsert
highlight ColorColumn ctermbg=0 guibg=lightgrey

set shortmess-=F

let g:sql_type_default = 'pgsql'
let g:ftplugin_sql_omni_key = '<C-j>'

autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx

let g:airline_powerline_fonts = 1

lua require('valde')

runtime keys.vim
runtime lsp.vim

au BufWinEnter NvimTree setlocal rnu
