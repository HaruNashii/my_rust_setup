-- =====================================
-- ===============# PLUGINS #===========
-- =====================================
local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/plugged/')

-- misc
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim', { ['tag'] = '0.1.6' })
Plug('andweeb/presence.nvim')
Plug('norcalli/nvim-colorizer.lua')
Plug('roobert/search-replace.nvim')

-- rust specific
Plug('saecki/crates.nvim',            { ['tag'] = 'stable' })
Plug('simrat39/rust-tools.nvim')

-- package managers
Plug('williamboman/mason.nvim')
Plug('williamboman/mason-lspconfig.nvim')

-- LSP, Code Completion and Code Highlight
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })
Plug('neovim/nvim-lspconfig')
Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/cmp-cmdline')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-nvim-lua')
Plug('hrsh7th/cmp-nvim-lsp-signature-help')
Plug('hrsh7th/cmp-vsnip')                             
Plug('hrsh7th/cmp-path')                              
Plug('hrsh7th/cmp-buffer')                            
Plug('hrsh7th/vim-vsnip')

-- themes
Plug('catppuccin/nvim')
-- Plug("tiagovla/tokyodark.nvim")

vim.call('plug#end')
