set hidden

set updatetime=300

set shortmess+=c

set signcolumn=yes

au BufRead,BufNewFile *.sbt,*.sc set filetype=scala

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

"nmap <silent> <leader> e <Plug>(coc-type-definition)
nnoremap <silent> <leader>e :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <silent> <leader>gn <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev)

nmap <Leader>ws <Plug>(coc-metals-expand-decoration)

autocmd CursorHold * silent call CocActionAsync('highlight')
nnoremap <silent> <leader>. :call CocActionAsync('showSignatureHelp')<CR>

nmap <leader>rn <Plug>(coc-rename)

nmap <leader>fo :call CocAction('format')<CR>

" Use `:Format` to format current buffer
"command! -nargs=0 Format :call CocAction('format')

nmap <leader>qf <Plug>(coc-fix-current)

xmap <leader>a <Plug>(coc-codeaction-line)
nmap <leader>a <Plug>(coc-codeaction-line)
