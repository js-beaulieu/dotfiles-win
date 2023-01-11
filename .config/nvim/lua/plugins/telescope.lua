-- exported module
local module = {}

module.config = function()
    -- select git files, fallback on project files if not a git repo
  local function ctrl_p()
    vim.fn.system("git rev-parse --is-inside-work-tree")
    if vim.v.shell_error == 0 then
      return require("telescope.builtin").git_files()
    else
      return require("telescope.builtin").find_files()
    end
  end

  -- setup plugin
  local telescope = require("telescope")
  telescope.setup({
    pickers = {
      buffers = {
        theme = "ivy",
      },
      commands = {
        theme = "ivy",
      },
      find_files = {
        theme = "ivy",
      },
      git_files = {
        theme = "ivy",
      },
      live_grep = {
        theme = "ivy",
      },
    },
  })
  telescope.load_extension("fzf")

  -- additional keymaps
  local map = vim.keymap.set
  map("n", "<C-P>", ctrl_p, {})
  map("n", "<leader><leader>p", require("telescope.builtin").commands, {})
  map("n", "<leader><leader>f", require("telescope.builtin").live_grep, {})
  map("n", "<leader><leader>b", require("telescope.builtin").buffers, {})
end

return module

