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
keymap(
    "v",
    "<leader>re",
    [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]],
    { noremap = true, silent = true, expr = false }
)
keymap(
    "v",
    "<leader>rf",
    [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]],
    { noremap = true, silent = true, expr = false }
)
keymap(
    "v",
    "<leader>rv",
    [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]],
    { noremap = true, silent = true, expr = false }
)
keymap(
    "v",
    "<leader>ri",
    [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
    { noremap = true, silent = true, expr = false }
)

-- Extract block doesn't need visual mode
keymap(
    "n",
    "<leader>rb",
    [[ <Cmd>lua require('refactoring').refactor('Extract Block')<CR>]],
    { noremap = true, silent = true, expr = false }
)
keymap(
    "n",
    "<leader>rbf",
    [[ <Cmd>lua require('refactoring').refactor('Extract Block To File')<CR>]],
    { noremap = true, silent = true, expr = false }
)

-- Inline variable can also pick up the identifier currently under the cursor without visual mode
keymap(
    "n",
    "<leader>ri",
    [[ <Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
    { noremap = true, silent = true, expr = false }
)

--- barbar.nvim
keymap('n', '<A-,>', '<Cmd>BufferPrevious<CR>', { noremap = true, silent = true })
keymap('n', '<A-.>', '<Cmd>BufferNext<CR>', { noremap = true, silent = true })
-- Re-order to previous/next
keymap('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', { noremap = true, silent = true })
keymap('n', '<A->>', '<Cmd>BufferMoveNext<CR>', { noremap = true, silent = true })
-- Goto buffer in position...
keymap('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', { noremap = true, silent = true })
keymap('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', { noremap = true, silent = true })
keymap('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', { noremap = true, silent = true })
keymap('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', { noremap = true, silent = true })
keymap('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', { noremap = true, silent = true })
keymap('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', { noremap = true, silent = true })
keymap('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', { noremap = true, silent = true })
keymap('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', { noremap = true, silent = true })
keymap('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', { noremap = true, silent = true })
keymap('n', '<A-0>', '<Cmd>BufferLast<CR>', { noremap = true, silent = true })
-- Close buffer
keymap('n', '<A-x>', '<Cmd>BufferClose<CR>', { noremap = true, silent = true })

--- lazygit.nvim
keymap("n", "<leader><leader>g", "<Cmd>LazyGit<CR>", { noremap = true, silent = true })

