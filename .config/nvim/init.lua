-- load modular configuration
require("settings")
require("keymaps")
require("plugins")

-- reload config on saving a configuration lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost $HOME/.config/nvim/{init,lua/settings,lua/keymaps,lua/plugins/*}.lua source $HOME/.config/nvim/init.lua | PackerSync
  augroup end
]])
