map Q <Nop>

nnoremap <silent> <leader>p :<C-u>GFiles!<cr> 
nnoremap <silent> <leader>o :<C-u>GFiles!?<cr> 
nnoremap <silent> <leader>i :<C-u>Files!<cr> 
nnoremap <silent> <leader>u :<C-u>Buffers!<cr> 

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

nnoremap <silent> <leader>// :<C-u>BLines!<cr>
nnoremap <silent> <leader>sg :<C-u>RG!<cr>
nnoremap <silent> <leader>sc :CocSearch 

nnoremap <leader>cg :RG! <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>cc :CocSearch <C-R>=expand("<cword>")<CR><CR>

command! -nargs=0 RCfg :source ~/.config/nvim/init.vim

nnoremap <leader>nt :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>

nnoremap <silent> <leader>gs :G<CR>
nnoremap <silent> <leader>gp :G push<CR>

nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>

nnoremap <expr><C-f> coc#util#has_float() ? coc#util#float_scroll(1) : "\<C-f>"
nnoremap <expr><C-b> coc#util#has_float() ? coc#util#float_scroll(0) : "\<C-b>"
