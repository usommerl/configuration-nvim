require('functions')
require('settings')
require('keymaps')
require('plugins')
require('config/nvim-metals')
require('config/nvim-lspconfig')

vim.cmd [[ au TextYankPost * silent! lua vim.highlight.on_yank {timeout=250, on_visual=false} ]]
read_if_exists_and_then(os.getenv('HOME') .. '/.vimrc_background', vim.cmd)
