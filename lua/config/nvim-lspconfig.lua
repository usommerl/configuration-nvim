local cmd = vim.cmd

cmd([[augroup fmt]])
cmd([[autocmd!]])
cmd([[autocmd BufWritePre *.scala,*.rs lua vim.lsp.buf.formatting_sync()]])
cmd([[augroup end]])


local present, lspconfig = pcall(require, 'lspconfig')
if not present then
    return
end

local servers = { 'rust_analyzer', 'tsserver' }
for _, lsp in pairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    flags = {
      -- This will be the default in neovim 0.7+
      debounce_text_changes = 150,
    }
  }
end
