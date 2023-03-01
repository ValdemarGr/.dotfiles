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
" set cursorcolumn
set hidden
:set completeopt=longest,menuone
set completeopt=menu,menuone,noselect
set termguicolors

set number relativenumber
set nu rnu

set ttimeout
set ttimeoutlen=0

set colorcolumn=120
set diffopt+=vertical

let mapleader = " "
let g:vimwiki_list = [{'path': '~/git/.dotfiles/wiki/', 'path_html':'~/git/.dotfiles/html/'}]

let g:copilot_node_command = "/home/valde/.nvm/versions/node/v16.15.0/bin/node"

highlight ColorColumn ctermbg=0 guibg=lightgrey

set shortmess-=F

set autoread
au FocusGained,BufEnter * :silent! !

let g:sql_type_default = 'pgsql'
let g:ftplugin_sql_omni_key = '<C-j>'

autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx

" autocmd BufWinLeave *.* mkview
" autocmd BufWinEnter *.* silent! loadview

let g:airline_powerline_fonts = 1

lua require('plenary.reload').reload_module('valde', true)
lua require('valde')

runtime keys.vim
runtime lsp.vim

" autocmd BufEnter *.{scala} :TSEnable hightlight
" TSEnable hightlight scala
" autocmd BufEnter *.{scala} :TSBufEnable scala

au BufWinEnter NvimTree setlocal rnu
