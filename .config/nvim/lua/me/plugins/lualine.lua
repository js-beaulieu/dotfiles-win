local lualine = {}

lualine.config = function()
  require("lualine").setup({
    options = {
      theme = "auto",
      globalstatus = false,
      section_separators = { left = "", right = "" },
      component_separators = { left = "", right = "" },
      disabled_filetypes = { },
    },
    sections = {
      -- left side
      lualine_a = {
        {
          "mode",
          fmt = string.lower,
          separator = { left = "", right = "" }
        }
      },

      -- right side
      lualine_z = {
        {
          'location',
          separator = { left = "", right = "" }
        }
      },
    }
  })
end

return lualine
