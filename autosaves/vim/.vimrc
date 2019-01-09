set nocompatible
syntax on
highlight Comment cterm=bold
filetype plugin on
set omnifunc=syntaxcomplete#Complete

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'vimwiki/vimwiki', { 'branch': 'dev' }

call plug#end()

let g:vimwiki_list = [{'path': '~/Git/notes', 'syntax': 'markdown', 'ext': '.md'}]

