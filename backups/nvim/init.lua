-- =====================================
-- ===========# DEFAULT CONFIG #========
-- =====================================
vim.o.termguicolors = true
vim.wo.wrap = false
vim.wo.linebreak = false
vim.wo.number = true

require("plugins")
require("config")
require("keybinds")
require("opts")

vim.cmd.colorscheme "catppuccin"
