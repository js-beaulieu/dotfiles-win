local options = {
  -- wildmenu
  wildmode = "longest:full,full",

  -- tabs/spaces
  expandtab = true,
  smarttab = true,
  shiftwidth = 4,
  tabstop = 4,

  -- mouse mode
  mouse = "a",

  -- encoding
  enc = "utf-8",

  -- disable auto-conceal
  conceallevel = 0,

  -- split direction
  splitbelow = true,
  splitright = true,

  -- timeout
  timeoutlen = 1000,
  ttimeoutlen = 0,

  -- editor
  cursorline = true,
  cursorcolumn = true,
  number = true,
  relativenumber = true,
  showcmd = true,
  showmatch = true,
  showmode = false,
  signcolumn = "yes",
  fillchars = "vert:|",
  laststatus = 2,
  cc = "80,120",
  termguicolors = true,
}

vim.opt.shortmess:append("c")
for k, v in pairs(options) do
  vim.opt[k] = v
end