nnoremap <silent> <leader>p :<C-u>GFiles!<cr> 
nnoremap <silent> <leader>o :<C-u>GFiles!?<cr> 
nnoremap <silent> <leader>i :<C-u>Files!<cr> 
nnoremap <silent> <leader>u :<C-u>Buffers!<cr> 

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

nnoremap <silent> <leader>// :<C-u>BLines!<cr>
nnoremap <silent> <leader>gf :<C-u>Rg!<cr>

nnoremap <leader>fw :Rg! <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>fwc :CocSearch <C-R>=expand("<cword>")<CR><CR>

command! -nargs=0 RCfg :source ~/.config/nvim/init.vim

