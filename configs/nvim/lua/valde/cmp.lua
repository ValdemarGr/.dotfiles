require('cmp')
require('cmp.utils.window')

local cmp = require('cmp')

cmp.setup {
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<Tab>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    -- ["<Tab>"] = cmp.mapping.select_next_item(),
    -- ["<S-Tab>"] = cmp.mapping.select_prev_item(),
  }),
  sources = cmp.config.sources({
    { name =  'nvim_lsp' },
    { name =  'luasnip' },
    { name =  'treesitter' },
    -- { name =  'copilot' },
    { name =  'nvim_lsp_signature_help' },
    { name =  'path' },
    { name =  'buffer' },
  })
  -- enabled = true;
  -- autocomplete = true;
  -- debug = false;
  -- min_length = 1;
  -- preselect = 'enable';
  -- throttle_time = 80;
  -- source_timeout = 200;
  -- resolve_timeout = 800;
  -- incomplete_delay = 400;
  -- max_abbr_width = 100;
  -- max_kind_width = 100;
  -- max_menu_width = 100;
  -- documentation = {
  --   border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
  --   winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
  --   max_width = 120,
  --   min_width = 60,
  --   max_height = math.floor(vim.o.lines * 0.3),
  --   min_height = 1,
  -- };

  -- source = {
  --   path = true;
  --   buffer = true;
  --   calc = true;
  --   nvim_lsp = true;
  --   nvim_lua = true;
  --   -- vsnip = true;
  --   -- ultisnips = true;
  --   luasnip = true;
  -- };
}

require("cmp_git").setup()

local _G = {}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
_G.caps = capabilities

return _G

-- local function prequire(...)
--     local status, lib = pcall(require, ...)
--     if (status) then return lib end
--     return nil
-- end

-- local luasnip = prequire('luasnip')

-- local t = function(str)
--     return vim.api.nvim_replace_termcodes(str, true, true, true)
-- end

-- local check_back_space = function()
--     local col = vim.fn.col('.') - 1
--     if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
--         return true
--     else
--         return false
--     end
-- end

-- _G.tab_complete = function()
--     if vim.fn.pumvisible() == 1 then
--         return t "<C-n>"
--     elseif require("luasnip").expand_or_jumpable() then
--         return t "<cmd>lua require'luasnip'.jump(1)<Cr>"
--     elseif check_back_space() then
--         return t "<Tab>"
--     else
--         return vim.fn["compe#complete"]()
--     end
-- end

-- _G.s_tab_complete = function()
--     print('s running!')
--     if vim.fn.pumvisible() == 1 then
--         return t "<C-p>"
--     elseif require("luasnip").jumpable(-1) then
--         return t "<cmd>lua require'luasnip'.jump(-1)<CR>"
--     else
--         return t "<S-Tab>"
--     end
-- end
