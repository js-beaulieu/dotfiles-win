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
      hijack_netrw_behavior = "disabled",
      use_libuv_file_watcher = true,
    },
    event_handlers = {
      {
        event = "file_opened",
        handler = function(file_path)
          require("neo-tree").close_all()
        end
      },
      {
        event = "neo_tree_buffer_leave",
        handler = function()
          require("neo-tree").close_all()
        end
      },
    },
  })

  -- key mappings
  local map = vim.api.nvim_set_keymap
  map("n", "\\", ":Neotree toggle<cr>", { noremap = true, silent = true })
end

return module

