local module = {}

module.config = function()
  -- remove v1 legacy commands
  vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

  -- If you want icons for diagnostic errors, you'll need to define them somewhere:
  vim.fn.sign_define("DiagnosticSignError",
    {text = " ", texthl = "DiagnosticSignError"})
  vim.fn.sign_define("DiagnosticSignWarn",
    {text = " ", texthl = "DiagnosticSignWarn"})
  vim.fn.sign_define("DiagnosticSignInfo",
    {text = " ", texthl = "DiagnosticSignInfo"})
  vim.fn.sign_define("DiagnosticSignHint",
    {text = "", texthl = "DiagnosticSignHint"})

  -- configure
  require("neo-tree").setup({
    close_if_last_window = true,
    default_component_configs = {
      name = {
        trailing_slash = true,
      },
    },
    window = {
      width = 50,
    },
    filesystem = {
      follow_current_file = true,
      group_empty_dirs = true,
      hijack_netrw_behavior = "open_default",
      use_libuv_file_watcher = true,
    },
  })

  -- key mappings
  local map = vim.api.nvim_set_keymap
  local map_utils = require("utils.map")
  map("n", "\\", map_utils.lua_expr(function()
    if vim.bo.filetype == "neo-tree" then
      return ":noautocmd wincmd p<cr>"
    else
      return ":Neotree focus<cr>"
    end
  end), { noremap = true, silent = true, expr = true })
  map("n", "<leader>\\", ":Neotree toggle<cr>", { noremap = true, silent = true })
end

return module

