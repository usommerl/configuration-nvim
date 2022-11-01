local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
    install_path })
end

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use { 'wbthomason/packer.nvim' }
  use { 'lewis6991/impatient.nvim' }
  use { 'dstein64/vim-startuptime' }
  use { 'lambdalisue/suda.vim' }
  use { 'LnL7/vim-nix' }
  use { 'tversteeg/registers.nvim',
    config = function() require("registers").setup() end,
  }
  use {
    'williamboman/nvim-lsp-installer',
    'neovim/nvim-lspconfig'
  }
  use {
    'dstein64/vim-win',
    cmd = 'Win'
  }
  use {
    'airblade/vim-rooter',
    event = "VimEnter",
    config = function() require('config/vim-rooter') end
  }
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require('config/nvim-tree') end
  }
  use {
    'AndrewRadev/sideways.vim',
    cmd = { 'SidewaysLeft', 'SidewaysRight' }
  }
  use {
    'AndrewRadev/linediff.vim',
    cmd = 'Linediff'
  }
  use {
    'numToStr/Comment.nvim',
    config = function() require('Comment').setup() end
  }
  use {
    'scalameta/nvim-metals',
    requires = { 'nvim-lua/plenary.nvim' },
  }
  use {
    'folke/trouble.nvim',
    requires = {
      { 'kyazdani42/nvim-web-devicons' },
      { 'folke/lsp-colors.nvim' },
    },
    cmd = 'TroubleToggle',
    config = function() require('trouble').setup() end
  }
  use {
    "folke/noice.nvim",
    event = "VimEnter",
    requires = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function() require("noice").setup() end
  }
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'onsails/lspkind-nvim' },
    },
    config = function() require('config/nvim-cmp') end
  }
  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function() require('config/indent-blankline') end
  }
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    tag = 'release',
    config = function() require('gitsigns').setup() end
  }
  use {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    requires = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
      { 'nvim-telescope/telescope-frecency.nvim' },
      { 'jvgrootveld/telescope-zoxide' },
      { 'tami5/sqlite.lua' }
    },
    cmd = 'Telescope',
    config = function() require('config/telescope') end
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function() require('config/lualine') end
  }
  use {
    'simrat39/symbols-outline.nvim',
    config = function() require("symbols-outline").setup() end
  }

  -- colorschemes
  use { 'mhartington/oceanic-next' }
  use { 'rakr/vim-one' }
  use { 'rmehri01/onenord.nvim', branch = 'main' }
  use { 'kaicataldo/material.vim', branch = 'main' }
  use { 'sainnhe/edge' }
  use { 'projekt0n/github-nvim-theme' }
  use { 'EdenEast/nightfox.nvim' }
  use { 'rebelot/kanagawa.nvim' }
  use { "catppuccin/nvim", as = "catppuccin" }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
