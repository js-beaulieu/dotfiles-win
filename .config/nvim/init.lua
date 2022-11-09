-- disable netrw ASAP - recommended by nvim-tree
-- see https://github.com/nvim-tree/nvim-tree.lua#setup
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- load configs
require("options")
require("keymaps")
require("plugins")

