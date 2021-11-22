local opt = vim.opt
local indent = 2

opt.backup = false
opt.clipboard = 'unnamedplus'
opt.cmdheight = 2
opt.colorcolumn = '9999' -- See: https://github.com/lukas-reineke/indent-blankline.nvim/issues/59
opt.completeopt = { 'menu', 'noinsert', 'noselect' }
opt.cursorline = true
opt.expandtab = true
opt.hidden = true
opt.inccommand = 'nosplit'
opt.lazyredraw = true
opt.list = true
opt.listchars = { tab = '▸ ', trail = '█', nbsp = '%' }
opt.number = true
opt.pumblend = 15
opt.relativenumber = true
opt.shiftwidth = indent
opt.shortmess:append("c")
opt.showmode = false
opt.signcolumn = 'yes:2'
opt.softtabstop = indent
opt.tabstop = indent
opt.termguicolors = true
opt.title = true
opt.undofile = true
opt.updatetime = 300
opt.writebackup = false
