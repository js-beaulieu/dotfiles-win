local lualine = {}

lualine.config = function()
  require("lualine").setup({
    options = {
      theme = "auto",
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = { "packer", "neo-tree" },
    },
  })
end

return lualine
