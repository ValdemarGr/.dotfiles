
set scrolloff=12
"set termguicolors
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

runtime metals.vim 
runtime keys.vim
runtime easymotion.vim
runtime fzf.vim

lua require('telescope-config')

function s:AllocTerm ()
  if exists(g:term_swap_id)
    echo 'Terminal already allocated.'
  else
    call s:ForcePush ()
    exec ':terminal'
    let g:term_swap_id = buffer_number()
  endif
endfunction

function s:ForcePush ()
  let g:term_prev_stack = [buffer_number(), buffer_number('#')]
endfunction

function s:PopAlt () 
  if exists(g:term_swap_id) && exists(g:term_prev_stack)
    let l:prim = g:term_prev_stack[0]
    let l:alt = g:term_prev_stack[1]
    execute ':b ' . l:alt
    execute ':b ' . l:prim
  else
    echo 'No term to switch to or swap stack empty'
  endif
endfunction

function s:ToggleAlt ()
  call s:AllocTerm ()
  if len(get(g:, 'term_prev_stack', [])) > 0
  else
    let g:term_prev_tog = 0
  endif
  if g:term_prev_tog
    call s:PopAlt()
    let g:term_prev_tog = 0
  else
    call s:ForcePush()
    execute ':b ' . g:term_swap_id
    let g:term_prev_tog = 1
  endif
endfunction

command! AllocateTerm call s:AllocTerm()
command! ToggleTerm call s:ToggleAlt()


