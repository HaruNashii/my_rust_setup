-- =====================================
-- =============# VARIABLES #===========
-- =====================================
local map_key = vim.keymap.set
local telescope = require('telescope.builtin')



-- =====================================
-- =============# KEYBINDS #============
-- =====================================
map_key('n', '<C-s>',     telescope.live_grep,  {}) -- open file finder
map_key('n', '<C-Space>', telescope.find_files, {}) -- open file finder

map_key("n", "<C-j>", ":m .+1<CR>==") -- move line up(n)
map_key("n", "<C-k>", ":m .-2<CR>==") -- move line down(n)
map_key("v", "<C-j>", ":m '>+1<CR>gv=gv") -- move line up(v)
map_key("v", "<C-k>", ":m '<-2<CR>gv=gv") -- move line down(v)
