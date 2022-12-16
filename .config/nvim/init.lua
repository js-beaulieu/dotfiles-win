local namespace = "me"

-- load modular configuration
require(namespace .. ".settings")
require(namespace .. ".keymaps")
require(namespace .. ".plugins")

-- reload neovim config when modifying one of the files
vim.api.nvim_create_augroup("packer_user_config", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
  group = "packer_user_config",
  pattern = {
    vim.fn.expand("~") .. "/.config/nvim/init.lua",
    vim.fn.expand("~") .. "/.config/nvim/lua/" .. namespace .. "/**/*.lua",
  },
  callback = function()
    -- clear lua cache
    for name, _ in pairs(package.loaded) do
      if name:match("^" .. namespace) then
        package.loaded[name] = nil
      end
    end

    -- reload config
    dofile(vim.env.MYVIMRC)
    vim.cmd("silent !notify-send 'neovim' 'Configuration reloaded'")
  end,
})
