local colorscheme = {}

colorscheme.config = function()
  local theme = require("onedarkpro")
  theme.setup({
    options = {
      bold = true,
      cursorline = true,
      terminal_colors = true,
      transparency = true,
      highlight_inactive_windows = true,
    },
  })

  vim.cmd "colorscheme onedark"
  vim.cmd "hi! link CursorColumn CursorLine"
end

return colorscheme

