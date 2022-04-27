require("valde.harpoon")
telescope = require('valde.telescope')
compe = require('valde.compe')
require('valde.hop')
require('valde.terraform')
-- require('valde.saga')
require('valde.rescript')
require('valde.luasnip')
require('valde.treesitter')
-- require('valde.lualine')
-- require('valde.octo')
require('valde.keys')
nvimtree = require('valde.luatree')
require('valde.metals')

local M = {}

M.telescope = telescope
M.compe = compe
M.nvimtree = nvimtree

return M
