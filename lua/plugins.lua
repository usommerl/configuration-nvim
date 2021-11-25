local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use { 'wbthomason/packer.nvim' }
  use { 'lewis6991/impatient.nvim' }
  use { 'dstein64/vim-startuptime' }
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
    cmd = { 'SidewaysLeft', 'SidewaysRight'}
  }
  use {
    'AndrewRadev/linediff.vim',
    cmd = 'Linediff'
  }
  use {
    'nathom/filetype.nvim',
    config = function() require('config/filetype') end
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
    'hrsh7th/nvim-cmp',
    requires = {
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'onsails/lspkind-nvim'},
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
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
    config = function() require('config/lualine') end
  }

  -- colorschemes
  use { 'dracula/vim' }
  use { 'mhartington/oceanic-next' }
  use { 'rakr/vim-one' }
  use { 'rmehri01/onenord.nvim', branch = 'main' }
  use { 'kaicataldo/material.vim', branch = 'main' }
  use { 'baskerville/bubblegum' }
  use { 'sainnhe/edge' }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
