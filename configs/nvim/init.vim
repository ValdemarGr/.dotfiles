syntax on

set scrolloff=12
"set termguicolors
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
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

set number relativenumber
set nu rnu

set ttimeout
set ttimeoutlen=0

set colorcolumn=120
highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')

Plug 'AlessandroYorba/Alduin'
Plug 'AlessandroYorba/Sierra'
Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', { 'branch' : 'release' }

Plug 'tpope/vim-surround'
Plug 'preservim/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'easymotion/vim-easymotion'
Plug 'vim-airline/vim-airline'
Plug 'hashivim/vim-terraform'
Plug 'preservim/nerdtree'

call plug#end()

let g:gruvbox_contrast_dark='hard'

let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --glob "!\.git/*"'
let $FZF_DEFAULT_OPTS="--ansi --layout reverse --preview 'bat --color always --style=header,grid --line-range :300 {}'"

colorscheme gruvbox
set background=dark

let mapleader = " "

let g:fzf_preview_window = 'right:48%'
let g:fzf_buffers_jump = 1

command! -bang -nargs=* RG
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

runtime metals.vim 
runtime keys.vim
runtime easymotion.vim


