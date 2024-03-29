local opt = vim.opt
local indent = 2

opt.backup = false
opt.clipboard = 'unnamedplus'
opt.colorcolumn = '9999' -- See: https://github.com/lukas-reineke/indent-blankline.nvim/issues/59
opt.completeopt = { 'menu', 'noinsert', 'noselect' }
opt.cursorline = true
opt.expandtab = true
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

vim.diagnostic.config {
  float = { border = "rounded" },
}

local signs = { Error = "", Warn = "", Hint = "", Info = "" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = {
    prefix = '|', -- e.g.: '■' '●', '▎', 'x'
  }
})
