local module = {}

module.config = function()
  -- setup plugin
  local telescope = require("telescope")
  telescope.setup({})
  telescope.load_extension("fzf")

  -- keymap
  local builtin = require("telescope.builtin")
  local map = vim.keymap.set
  map("n", "<C-P>", builtin.find_files, {})
  map("n", "<leader><leader>f", builtin.live_grep, {})
  map("", "<leader><leader>b", builtin.buffers, {})
end

return module
