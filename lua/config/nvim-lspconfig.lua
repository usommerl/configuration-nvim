local cmd = vim.cmd

cmd([[augroup fmt]])
cmd([[autocmd!]])
cmd([[autocmd BufWritePre *.scala,*.lua,*.rs,*.json lua vim.lsp.buf.format()]])
cmd([[augroup end]])

local present, lspconfig = pcall(require, 'lspconfig')
if present then
  require("mason").setup()
  require("mason-lspconfig").setup({
    automatic_installation = true,
  })
else
  return
end


local servers = { 'rust_analyzer', 'tsserver', 'pyright', 'marksman', 'lua_ls', 'jsonls', 'angularls', 'rnix',
  'yamlls', 'dartls' }
for _, lsp in pairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
  }
end
