-- require('plenary.reload').reload_module('nvim-tree', true)
-- require('plenary.reload').reload_module('telescope', true)
-- require('plenary.reload').reload_module('metals', true)

require("valde.gitsigns")
require("valde.harpoon")
telescope = require('valde.telescope')
require('valde.cmp')
require('valde.hop')
require('valde.terraform')
-- require('valde.saga')
require('valde.rescript')
require('valde.luasnip')
require('valde.treesitter')
-- require('valde.lualine')
-- require('valde.octo')
nvimtree = require('valde.luatree')
require('valde.metals')

local M = {}

M.telescope = telescope
M.nvimtree = nvimtree

return M
