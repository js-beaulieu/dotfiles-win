local colorscheme = {}

colorscheme.config = function()
  local theme = require("material")
  theme.setup({
    lualine_style = "stealth",
    transparent = true,
    disable = { background = true },
  })

  vim.cmd "colorscheme material"
  vim.g.material_style = "darker"
end

return colorscheme

