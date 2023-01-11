-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

-- use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
  print("Failed to load lazy.nvim")
  return
end

-- merge config with config extracted to its own file
local function load_config(filename, config)
  local c = require("plugins." .. filename)
  if config == nil then
    return c
  end
  return vim.tbl_deep_extend("force", c, config)
end

-- setup plugins
lazy.setup({
  load_config("tmux", {
    "christoo/vim-tmux-navigator",
  }),
  {
    "dag/vim-fish",
    ft = { "fish" },
  },
  "editorconfig/editorconfig-vim",
  "github/copilot.vim",
  load_config("markdown", {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    ft = { "markdown" },
  }),
  "kdheepak/lazygit.nvim",
  {
    "nmac427/guess-indent.nvim",
    config = function()
        require("guess-indent").setup()
    end,
  },
  load_config("gitsigns", {
    "lewis6991/gitsigns.nvim",
  }),
  "norcalli/nvim-colorizer.lua",
  load_config("colorscheme", {
    "olimorris/onedarkpro.nvim",
  }),
  load_config("lualine", {
    "nvim-lualine/lualine.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons" },
  }),
  load_config("filetree", {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
  }),
  load_config("telescope", {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.0",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
    },
  }),
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },
  load_config("hop", {
    "phaazon/hop.nvim",
    branch = "v1",
  }),
  "rbgrouleff/bclose.vim",
  load_config("barbar", {
    "romgrk/barbar.nvim",
    dependencies = {"kyazdani42/nvim-web-devicons"},
  }),
  "tpope/vim-commentary",
  "tpope/vim-surround",
  "tpope/vim-vinegar",
  load_config("lsp", {
    "williamboman/nvim-lsp-installer",
    dependencies = {
      "neovim/nvim-lspconfig",
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "saadparwaiz1/cmp_luasnip",
      "nvim-treesitter/nvim-treesitter",
      "L3MON4D3/LuaSnip",
      { "jose-elias-alvarez/null-ls.nvim", requires = { "nvim-lua/plenary.nvim" } },
    },
  }),
})

