"native
map Q <Nop>
command W w

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

"NT
nnoremap <leader>nt <cmd>lua require('valde').nvimtree.toggle()<CR>
nnoremap <leader>nf <cmd>lua require('valde').nvimtree.find_file()<CR>

"Fug
nnoremap <silent> <leader>gs :G<CR>
nnoremap <silent> <leader>gp :G push<CR>
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>

""dadbod
"nnoremap <silent> <leader>db :DBUI<CR>

"hop
nnoremap <silent><leader>m1 <cmd>HopChar1<CR>
nnoremap <silent><leader>m2 <cmd>HopChar2<CR>
nnoremap <silent><leader>mp <cmd>HopPattern<CR>
nnoremap <silent><leader>mw <cmd>HopWord<CR>

"lsp
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })
" nnoremap <silent><leader>e       <cmd>lua vim.lsp.buf.hover()<CR>
" nnoremap <silent><leader>a       <cmd>lua vim.lsp.buf.code_action()<CR>
"nnoremap <silent>gd              <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent><leader>fo      <cmd>lua vim.lsp.buf.formatting_sync()<CR>

inoremap <C-c> <Esc>

"telescope
nnoremap <silent><leader>. <cmd>lua require('valde').telescope.search_dotfiles()<CR>
nnoremap <silent><leader>i <cmd>lua require('telescope.builtin').find_files()<CR>
nnoremap <silent><leader>p <cmd>lua require('telescope.builtin').git_files()<CR>
nnoremap <silent><leader>// <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>
nnoremap <silent><leader>u <cmd>lua require('telescope.builtin').buffers()<CR>
" nnoremap <silent><leader>x <cmd>lua require('telescope').extensions.zoxide.list()<CR>
nnoremap <silent><leader>s <cmd>lua require('telescope.builtin').live_grep()<CR>
nnoremap <silent><leader>o <cmd>lua require('telescope.builtin').git_status()<CR>
nnoremap <silent>gd              <cmd>lua require('telescope.builtin').lsp_definitions()<CR>
" nnoremap <silent><leader>gd              <cmd>lua require('telescope.builtin').lsp_references()<CR>

"saga is no longer maintained??
" nnoremap <silent>gd <cmd>lua require('lspsaga.provider').lsp_finder()<CR>
" nnoremap <silent><leader>gd <cmd>lua require('lspsaga.provider').preview_definition()<CR>

" binds before
" nnoremap <silent><leader>e       <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
" nnoremap <silent><leader>q       <cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>
" nnoremap <silent><leader>a       <cmd>lua require('lspsaga.codeaction').code_action()<CR>
" nnoremap <silent><leader>dn       <cmd>lua require('lspsaga.diagnostic').lsp_jump_diagnostic_next()<CR>
" nnoremap <silent><leader>dp       <cmd>lua require('lspsaga.diagnostic').lsp_jump_diagnostic_prev()<CR>
" nnoremap <silent><leader>dc       <cmd>lua require('lspsaga.diagnostic').show_cursor_diagnostics()<CR>
" nnoremap <silent><leader>dl       <cmd>lua require('lspsaga.diagnostic').show_line_diagnostics()<CR>

" telescope equivalents
nnoremap <silent><leader>e       <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent><leader>q       <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent><leader>a       <cmd>Telescope lsp_code_actions<CR>
nnoremap <silent><leader>dn       <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <silent><leader>dp       <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent><leader>dc       <cmd>lua vim.lsp.diagnostic.show_position_diagnostics()<CR>
nnoremap <silent><leader>dl       <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>

nnoremap <silent><leader>x <cmd>buffer term://*<CR>

" buildsystem
let g:bazel_make_command = "Make!"
nnoremap <silent><leader>bb    <cmd>Bazel build //...<CR>
nnoremap <silent><leader>bt    <cmd>Bazel test --test_output=errors //...<CR>
nnoremap <silent><leader>br    <cmd>Dispatch! REPIN=1 bazel run @unpinned_maven//:pin<CR>
nnoremap <silent><leader>bf    <cmd>e %:h/BUILD.bazel<CR>

nnoremap <silent><leader>qn    <cmd>cnext<CR>
nnoremap <silent><leader>qp    <cmd>cprev<CR>
nnoremap <silent><leader>qo    <cmd>Copen<CR>
