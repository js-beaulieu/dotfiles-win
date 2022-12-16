local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer...")
  vim.cmd([[packadd packer.nvim]])
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float()
    end,
  },
})

packer.startup(function(use)
  -- Let packer manage itself
  use("wbthomason/packer.nvim")

  -- Plugins
  use("dag/vim-fish")
  use({
    "nmac427/guess-indent.nvim",
    config = function()
        require("guess-indent").setup({})
    end,
  })
  use({
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    setup = require("me.plugins.markdown").config,
    ft = { "markdown" },
  })
  use({
    "christoomey/vim-tmux-navigator",
    config = require("me.plugins.tmux").config,
  })
  use("editorconfig/editorconfig-vim")
  use({
    "ibhagwan/fzf-lua",
    requires = { "kyazdani42/nvim-web-devicons" },
    config = require("me.plugins.fzf").config,
  })
  use({
    "lewis6991/gitsigns.nvim",
    config = require("me.plugins.gitsigns").config,
  })
  use("kdheepak/lazygit.nvim")
  use("norcalli/nvim-colorizer.lua")
  use({
    "olimorris/onedarkpro.nvim",
    config = require("me.plugins.colorscheme").config,
  })
  use({
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons" },
    config = require("me.plugins.lualine").config,
    before = "material",
  })
  use({
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = require("me.plugins.filetree").config,
  })
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  })
  use({
    "phaazon/hop.nvim",
    branch = "v1",
    config = require("me.plugins.hop").config,
  })
  use("rbgrouleff/bclose.vim")
  use("tpope/vim-commentary")
  use("tpope/vim-surround")
  use("tpope/vim-vinegar")
  use({
    "williamboman/nvim-lsp-installer",
    requires = {
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
  })
  use({
    "romgrk/barbar.nvim",
    requires = {"kyazdani42/nvim-web-devicons"},
    config = require("me.plugins.barbar").config,
  })

  -- Automatically set up configuration after cloning packer.nvim
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
