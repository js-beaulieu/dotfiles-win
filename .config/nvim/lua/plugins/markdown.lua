local module = {}

module.init = function()
  -- auto open and close on focusing markdown buffers
  vim.g.mkdp_auto_start = 1
  vim.g.mkdp_auto_close = 1
end

return module
