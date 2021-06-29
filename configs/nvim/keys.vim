"native
map Q <Nop>
command W w

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

"NT
nnoremap <leader>nt :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>

"Fug
nnoremap <silent> <leader>gs :G<CR>
nnoremap <silent> <leader>gp :G push<CR>
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>

"dadbod
nnoremap <silent> <leader>db :DBUI<CR>

"lsp
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })
nnoremap <silent><leader>e       <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent><leader>a       <cmd>lua vim.lsp.buf.code_action()<CR>
"nnoremap <silent>gd              <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent><leader>fo      <cmd>lua vim.lsp.buf.formatting_sync()<CR>

inoremap <C-c> <Esc>

"telescope
nnoremap <silent><leader>. <cmd>lua require('valde').telescope.search_dotfiles()<CR>
nnoremap <silent><leader>i <cmd>lua require('telescope.builtin').find_files()<CR>
nnoremap <silent><leader>p <cmd>lua require('telescope.builtin').git_files()<CR>
nnoremap <silent><leader>// <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>
nnoremap <silent><leader>u <cmd>lua require('telescope.builtin').buffers()<CR>
nnoremap <silent><leader>x <cmd>lua require('telescope').extensions.zoxide.list()<CR>
nnoremap <silent><leader>gd              <cmd>lua require('telescope.builtin').lsp_references()<CR>
nnoremap <silent>gd              <cmd>lua require('telescope.builtin').lsp_definitions()<CR>
