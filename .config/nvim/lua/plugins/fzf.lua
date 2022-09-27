local fzf = {}

fzf.config = function()
  require("fzf-lua").setup({
    -- make lsp requests synchronous so they work with null-ls
    lsp = { async_or_timeout = 3000 },
    grep = {
      rg_opts = '--column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --color "always"',
    },
  })
end

return fzf