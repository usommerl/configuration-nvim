local cmd = vim.cmd

cmd([[augroup fmt]])
cmd([[autocmd!]])
cmd([[autocmd BufWritePre *.scala,*.lua,*.rs lua vim.lsp.buf.formatting_sync()]])
cmd([[augroup end]])

local present, lspconfig = pcall(require, 'lspconfig')
if not present then
  return
end

local present, lspinstaller = pcall(require, 'nvim-lsp-installer')
if present then
  lspinstaller.setup {
    automatic_installation = true,
  }
end

local servers = { 'rust_analyzer', 'tsserver', 'pyright', 'marksman', 'sumneko_lua' }
for _, lsp in pairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
  }
end
