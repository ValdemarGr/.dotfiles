
if has('nvim-0.5')
  augroup lsp
    au!
    au FileType scala,sbt lua require('metals').initialize_or_attach({})
  augroup end
endif

set completeopt=menuone,noselect
