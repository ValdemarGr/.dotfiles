require("nvim-treesitter.configs").setup{}

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.scala = {
  install_info = {
    url = "https://github.com/tree-sitter/tree-sitter-scala",
    files = {"src/parser.c"}
  },
  filetype = "scala"
}

