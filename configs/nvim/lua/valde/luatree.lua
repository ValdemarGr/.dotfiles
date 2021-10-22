vim.g["nvim_tree_quit_on_open"] = 1

require("nvim-tree").setup {
  view = {
    width = "40%"
  }
}

function toggle()
  require("nvim-tree").toggle()
  vim.wo.number = true
  vim.wo.relativenumber = true
end

function find_file()
  require("nvim-tree").find_file(true)
  vim.wo.number = true
  vim.wo.relativenumber = true
end

local M = {}

M.toggle = toggle
M.find_file = find_file

return M
