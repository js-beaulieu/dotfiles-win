--- leader key
vim.g.mapleader = ","

--- vars
local keymap = vim.api.nvim_set_keymap

--- clear search after hitting backspace in normal mode
keymap("n", "<backspace>", ":noh<cr>", { noremap = true, silent = true })

--- fzf
keymap("n", "<C-P>", "<cmd>lua require('fzf-lua').files()<cr>", {
    noremap = true,
    silent = true,
})
keymap("n", "<leader><leader>f", "<cmd>lua require('fzf-lua').live_grep()<cr>", { silent = true })
keymap("", "<leader><leader>b", "<cmd>lua require('fzf-lua').buffers()<cr>", { silent = true })

--- hop - EasyMotion-like movement
keymap(
    "n",
    "f",
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>"
    ,
    {}
)
keymap(
    "n",
    "F",
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>"
    ,
    {}
)
keymap(
    "o",
    "f",
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, inclusive_jump = true })<cr>"
    ,
    {}
)
keymap(
    "o",
    "F",
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = true })<cr>"
    ,
    {}
)
keymap(
    "",
    "t",
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>"
    ,
    {}
)
keymap(
    "",
    "T",
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>"
    ,
    {}
)
keymap(
    "n",
    "<Leader>f",
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false })<cr>"
    ,
    {}
)
keymap(
    "n",
    "<Leader>F",
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false })<cr>"
    ,
    {}
)
keymap(
    "o",
    "<Leader>f",
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false, inclusive_jump = true })<cr>"
    ,
    {}
)
keymap(
    "o",
    "<Leader>F",
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false, inclusive_jump = true })<cr>"
    ,
    {}
)

--- neo-tree - tree file explorer
keymap("n", "\\", ":Neotree toggle focus<cr>", { noremap = true, silent = true })

--- refactoring.nvim
-- Remaps for the refactoring operations currently offered by the plugin
vim.api.nvim_set_keymap(
    "v",
    "<leader>re",
    [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]],
    { noremap = true, silent = true, expr = false }
)
vim.api.nvim_set_keymap(
    "v",
    "<leader>rf",
    [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]],
    { noremap = true, silent = true, expr = false }
)
vim.api.nvim_set_keymap(
    "v",
    "<leader>rv",
    [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]],
    { noremap = true, silent = true, expr = false }
)
vim.api.nvim_set_keymap(
    "v",
    "<leader>ri",
    [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
    { noremap = true, silent = true, expr = false }
)

-- Extract block doesn't need visual mode
vim.api.nvim_set_keymap(
    "n",
    "<leader>rb",
    [[ <Cmd>lua require('refactoring').refactor('Extract Block')<CR>]],
    { noremap = true, silent = true, expr = false }
)
vim.api.nvim_set_keymap(
    "n",
    "<leader>rbf",
    [[ <Cmd>lua require('refactoring').refactor('Extract Block To File')<CR>]],
    { noremap = true, silent = true, expr = false }
)

-- Inline variable can also pick up the identifier currently under the cursor without visual mode
vim.api.nvim_set_keymap(
    "n",
    "<leader>ri",
    [[ <Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
    { noremap = true, silent = true, expr = false }
)