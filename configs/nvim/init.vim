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
set hidden

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
Plug 'tpope/vim-rhubarb'
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', { 'branch' : 'release' }

"Plug 'leafgarland/typescript-vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'peitalin/vim-jsx-typescript'

Plug 'tpope/vim-surround'
Plug 'preservim/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'easymotion/vim-easymotion'
Plug 'vim-airline/vim-airline'
Plug 'hashivim/vim-terraform'
Plug 'preservim/nerdtree'

Plug 'junegunn/goyo.vim'
Plug 'vlime/vlime', {'rtp': 'vim/'}

Plug 'lifepillar/pgsql.vim'
Plug 'google/vim-maktaba'
Plug 'bazelbuild/vim-bazel'

Plug 'Olical/vim-scheme', { 'for': 'scheme', 'on': 'SchemeConnect' }
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'

Plug 'farmergreg/vim-lastplace'
Plug 'vimwiki/vimwiki'

Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'

Plug 'ryanoasis/vim-devicons'

call plug#end()

let g:sql_type_default = 'pgsql'
let g:ftplugin_sql_omni_key = '<C-j>'

autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx

set diffopt+=vertical

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

let g:vimwiki_list = [{'path': '~/Git/.dotfiles/wiki/', 'path_html':'~/Git/.dotfiles/html/'}]

runtime metals.vim 
runtime keys.vim
runtime easymotion.vim

"" dark red
"hi tsxTagName guifg=#E06C75
"hi tsxComponentName guifg=#E06C75
"hi tsxCloseComponentName guifg=#E06C75

"" orange
"hi tsxCloseString guifg=#F99575
"hi tsxCloseTag guifg=#F99575
"hi tsxCloseTagName guifg=#F99575
"hi tsxAttributeBraces guifg=#F99575
"hi tsxEqual guifg=#F99575

"" yellow
"hi tsxAttrib guifg=#F8BD7F cterm=italic

"" light-grey
"hi tsxTypeBraces guifg=#999999
"" dark-grey
"hi tsxTypes guifg=#666666

"hi ReactState guifg=#C176A7
"hi ReactProps guifg=#D19A66
"hi ApolloGraphQL guifg=#CB886B
"hi Events ctermfg=204 guifg=#56B6C2
"hi ReduxKeywords ctermfg=204 guifg=#C678DD
"hi ReduxHooksKeywords ctermfg=204 guifg=#C176A7
"hi WebBrowser ctermfg=204 guifg=#56B6C2
"hi ReactLifeCycleMethods ctermfg=204 guifg=#D19A66
