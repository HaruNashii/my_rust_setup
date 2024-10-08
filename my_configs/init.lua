-- =====================================
-- ===========# DEFAULT CONFIG #========
-- =====================================
vim.o.termguicolors = true
vim.wo.wrap = false
vim.wo.number = true



-- =====================================
-- ===============# PLUGINS #===========
-- =====================================
local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/plugged/')

Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim', { ['tag'] = '0.1.6' })
Plug('andweeb/presence.nvim')
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })

Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-path')
Plug('hrsh7th/cmp-cmdline')
Plug('hrsh7th/nvim-cmp')

Plug('norcalli/nvim-colorizer.lua')

Plug('roobert/search-replace.nvim')

Plug("tiagovla/tokyodark.nvim")

vim.call('plug#end')

  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      expand = function(args)
      end,
    },
    window = {
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), 
    }),
    sources = cmp.config.sources({
    }, {
      { name = 'buffer' },
    })
  })

  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({ { name = 'path' }
    }, {
      { name = 'cmdline' }
    }),
    matching = { disallow_symbol_nonprefix_matching = false }
  })

require'nvim-treesitter.configs'.setup{highlight={enable=true}}
require'colorizer'.setup()



-- =====================================
-- ===============# MISC #==============
-- =====================================
local default_config = {
    transparent_background = true, -- set background to transparent
    gamma = 1.00, -- adjust the brightness of the theme
    styles = {
        comments = { italic = true }, -- style for comments
        keywords = { italic = true }, -- style for keywords
        identifiers = { italic = true }, -- style for identifiers
        functions = {}, -- style for functions
        variables = {}, -- style for variables
    },
    custom_highlights = {} or function(highlights, palette) return {} end, -- extend highlights
    custom_palette = {} or function(palette) return {} end, -- extend palette
    terminal_colors = true, -- enable terminal colors
}
require("tokyodark").setup(default_config)
vim.cmd [[colorscheme tokyodark]]


-- =====================================
-- =============# VARIABLES #===========
-- =====================================
local map = vim.keymap.set
local builtin = require('telescope.builtin')



-- =====================================
-- =============# KEYBINDS #============
-- =====================================
map('n', '<C-Space>', builtin.find_files, {}) -- open file finder

map("n", "<C-j>", ":m .+1<CR>==") -- move line up(n)
map("n", "<C-k>", ":m .-2<CR>==") -- move line down(n)
map("v", "<C-j>", ":m '>+1<CR>gv=gv") -- move line up(v)
map("v", "<C-k>", ":m '<-2<CR>gv=gv") -- move line down(v)



