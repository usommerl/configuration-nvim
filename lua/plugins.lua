local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd [[packadd packer.nvim]]

vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]]

return require('packer').startup(function(use)
 use { 'wbthomason/packer.nvim' }
 use { 'lewis6991/impatient.nvim' }
 use { 'dstein64/vim-startuptime' }
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
    config = require('config/filetype')
  }
  use {
    'lukas-reineke/indent-blankline.nvim',
    config = require('config/indent-blankline')
  }
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    tag = 'release',
    config = require('gitsigns').setup()
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
      { 'jvgrootveld/telescope-zoxide' }
    },
    cmd = 'Telescope',
    config = require('config/telescope')
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
    config = require('config/lualine')
  }

  -- colorschemes
  use { 'dracula/vim' }
  use { 'mhartington/oceanic-next' }
  use { 'rakr/vim-one' }
  use { 'rmehri01/onenord.nvim', branch = 'main' }
  use { 'kaicataldo/material.vim', branch = 'main' }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
