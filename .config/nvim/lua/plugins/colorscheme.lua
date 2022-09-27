local colorscheme = {}

colorscheme.config = function()
  local onedark = require("onedark")
  onedark.setup({
    style = "dark",
    transparent = true,
    code_style = {
      keywords = "italic",
    },
  })
  onedark.load()
end

return colorscheme