local colorscheme = {}

colorscheme.config = function()
  local theme = require("github-theme")
  theme.setup({
    theme_style = "dark_default",
    transparent = true,
  })
  vim.cmd([[ highlight CursorColumn guibg=#161b22 ]])
end

return colorscheme
