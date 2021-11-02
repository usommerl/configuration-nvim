require('functions')
require('settings')
require('keymaps')
require('plugins')

read_if_exists_and_then(os.getenv('HOME') .. '/.vimrc_background', vim.cmd)
