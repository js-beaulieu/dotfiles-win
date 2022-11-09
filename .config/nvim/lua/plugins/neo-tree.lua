local neo_tree = {}

neo_tree.config = function()
  --- remove legacy v1 commands
  vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

  --- diagnostic icons
  vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
  vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
  vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
  vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })

  --- configure
  local neotree = require("neo-tree")
  neotree.setup({
    close_if_last_window = true,
    enable_git_status = true,
    enable_diagnostics = true,
    window = {
      position = "left",
      width = 60,
      mapping_options = {
        noremap = true,
        nowait = true,
      },
    },
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
      },
      follow_current_file = true,
      hijack_netrw_behavior = "open_current",
      use_libuv_file_watcher = true,
    },
  })
end

return neo_tree
