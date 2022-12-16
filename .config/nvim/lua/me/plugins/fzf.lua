local module = {}

module.config = function()
  -- setup plugin
  require("fzf-lua").setup({
    -- make lsp requests synchronous so they work with null-ls
    lsp = { async_or_timeout = 3000 },
    grep = {
      rg_opts = '--column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --color "always"',
    },
  })

  -- keymap
  local map = vim.api.nvim_set_keymap
  map("n", "<C-P>", "<cmd>lua require('fzf-lua').git_files({ prompt='Tracked files>' })<cr>", {
      noremap = true,
      silent = true,
  })
  map("n", "<leader><leader>f", "<cmd>lua require('fzf-lua').live_grep()<cr>", { silent = true })
  map("", "<leader><leader>b", "<cmd>lua require('fzf-lua').buffers()<cr>", { silent = true })
end

return module
