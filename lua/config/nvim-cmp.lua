local present, cmp = pcall(require, 'cmp')
if not present then
    return
end

local lspkind = require('lspkind')

cmp.setup {
  sources = {
    { name = 'nvim_lsp' },
  },
  mapping = {
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
  },
  formatting = {
    format = lspkind.cmp_format({maxwidth = 60})
  }
}
