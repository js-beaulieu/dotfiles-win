local colorscheme = {}

colorscheme.config = function()
  local theme = require("onedarkpro")
  theme.setup({
    options = {
      bold = true,
      cursorline = true,
      terminal_colors = true,
      transparency = true,
      window_unfocused_color = true,
    },
  })

  vim.cmd "colorscheme onedarkpro"
  vim.cmd "hi! link CursorColumn CursorLine"
end

return colorscheme

