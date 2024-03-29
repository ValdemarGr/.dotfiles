local actions = require('telescope.actions')

-- require('telescope').load_extension('gh')
-- require('telescope').load_extension('frecency')
require('telescope').load_extension('zoxide')
require('telescope').load_extension('fzf')
require('telescope').load_extension('neoclip')

require('telescope').setup{
  defaults = {
      mappings = {
          i = {
              ["<C-c>"] = false
          },
          n = {
              ["<C-c>"] = actions.close
          }
      },
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    -- prompt_position = "bottom",
    prompt_prefix = "> ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        width = 0.95,
        height = 0.95,
        -- width_padding = 100,
        -- height_padding = 2,
        --preview_width=70,
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
    },
    file_sorter = require('telescope').extensions.fzf.native_fsf_sorter,
    file_ignore_patterns = {},
    generic_sorter =  require('telescope').extensions.fzf.native_fsf_sorter,
    winblend = 0,
    --width = 0.75,
    --preview_cutoff = 0,
    --results_height = 1,
    --results_width = 0.1,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  }-- ,
  -- extensions = {
  --   ["ui-select"] = {
  --     require("telescope.themes").get_dropdown {
  --     }
  --   }
  -- }
}

-- require('telescope').load_extension('ui-select')

local M = {}
M.search_dotfiles = function()
  require("telescope.builtin").git_files({
    prompt_title = "dotfiles >",
    cwd = "$DOTFILES"
  })
end

M.search_wiki = function()
  require("telescope.builtin").find_files({
    prompt_title = "wiki >",
    cwd = "$DOTFILES/wiki"
  })
end

return M
