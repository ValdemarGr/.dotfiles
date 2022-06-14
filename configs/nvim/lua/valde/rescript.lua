local cmp = require('valde.cmp')

require('lspconfig').rescriptls.setup{
  capabilities = cmp.caps,
  cmd = {
    'node',
    '/home/valde/.vim/plugged/vim-rescript/server/out/server.js',
    '--stdio'
  }
}
