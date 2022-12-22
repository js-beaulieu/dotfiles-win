local fn = vim.fn

-- Bootstrap lazy.nvim
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

-- Use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
  return
end

lazy.setup({
  {
    "christoomey/vim-tmux-navigator",
    config = require("me.plugins.tmux").config,
  },
  {
    "dag/vim-fish",
    ft = { "fish" },
  },
  "editorconfig/editorconfig-vim",
  "github/copilot.vim",
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    init = require("me.plugins.markdown").config,
    ft = { "markdown" },
  },
  "kdheepak/lazygit.nvim",
  {
    "nmac427/guess-indent.nvim",
    config = function()
        require("guess-indent").setup()
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = require("me.plugins.gitsigns").config,
  },
  "norcalli/nvim-colorizer.lua",
  {
    "olimorris/onedarkpro.nvim",
    config = require("me.plugins.colorscheme").config,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons" },
    config = require("me.plugins.lualine").config,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = require("me.plugins.filetree").config,
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.0",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
    },
    config = require("me.plugins.telescope").config,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },
  {
    "phaazon/hop.nvim",
    branch = "v1",
    config = require("me.plugins.hop").config,
  },
  "rbgrouleff/bclose.vim",
  {
    "romgrk/barbar.nvim",
    dependencies = {"kyazdani42/nvim-web-devicons"},
    config = require("me.plugins.barbar").config,
  },
  "tpope/vim-commentary",
  "tpope/vim-surround",
  "tpope/vim-vinegar",
  {
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
    config = require("me.plugins.lsp").config,
  },
})

