require('functions')
require('settings')
require('keymaps')

-- Setup lazy.nvim and install plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)
require("lazy").setup('plugins')

-- Misc
vim.cmd [[ au TextYankPost * silent! lua vim.highlight.on_yank {timeout=250, on_visual=false} ]]
read_if_exists_and_then(os.getenv('HOME') .. '/.vimrc_background', vim.cmd)
