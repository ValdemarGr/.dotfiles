-- require('plenary.reload').reload_module('nvim-tree', true)
-- require('plenary.reload').reload_module('telescope', true)
-- require('plenary.reload').reload_module('metals', true)

vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    "AckslD/nvim-neoclip.lua",
    requires = {
      {'kkharji/sqlite.lua', module = 'sqlite'},
      -- you'll need at least one of these
      -- {'nvim-telescope/telescope.nvim'},
      -- {'ibhagwan/fzf-lua'},
    },
    config = function()
      require('neoclip').setup({
        history = 1000,
        enable_persistent_history = true
      })
    end,
  }

  use {
    'pwntester/octo.nvim',
    -- requires = {
    --   'nvim-lua/plenary.nvim',
    --   'nvim-telescope/telescope.nvim',
    --   'kyazdani42/nvim-web-devicons',
    -- },
    config = function ()
      require"octo".setup()
    end
  }

  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      { "nvim-telescope/telescope-live-grep-args.nvim" },
    },
    config = function()
      require("telescope").load_extension("live_grep_args")
    end
  }
end)

require('lspconfig').graphql.setup{}

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
require('valde.octo')
nvimtree = require('valde.luatree')
require('valde.metals')
require('neoclip').setup()

local M = {}

M.telescope = telescope
M.nvimtree = nvimtree

return M
