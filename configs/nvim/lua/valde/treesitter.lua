local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.authzed = {
        install_info = {
                url = "https://github.com/mleonidas/tree-sitter-authzed", -- local path or git repo
                files = { "src/parser.c" },
                generate_requires_npm = false,
                requires_generate_from_grammar = false,
                -- optional entries:
                branch = "main", -- default branch in case of git repo if different from master
        },
        filetype = "authzed", -- if filetype does not match the parser name
}

require("nvim-treesitter.configs").setup{
  ensure_installed = { "scala", "graphql", "authzed" },
  highlight = {
    enable = true
  }
}

vim.cmd [[augroup Authzed]]
vim.cmd [[au!]]
vim.cmd [[autocmd BufNewFile,BufRead *.authzed set filetype=authzed]]
vim.cmd [[autocmd BufNewFile,BufRead *.zed set filetype=authzed]]
vim.cmd [[autocmd BufNewFile,BufRead *.azd set filetype=authzed]]
vim.cmd [[augroup Authzed]]


