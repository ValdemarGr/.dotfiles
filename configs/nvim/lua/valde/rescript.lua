local cmp = require('valde.cmp')

require('lspconfig').rescriptls.setup{
  capabilities = cmp.caps,
  cmd = {
    '/home/valde/.nvm/versions/node/v16.15.0/bin/node',
    '/home/valde/.vim/plugged/vim-rescript/server/out/server.js',
    '--stdio'
  }
}
