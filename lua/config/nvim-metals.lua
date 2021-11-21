local cmd = vim.cmd

metals_config = require('metals').bare_config()
metals_config.init_options.statusBarProvider = 'on'
metals_config.settings = {
  showImplicitArguments = true,
}

cmd [[autocmd CursorHold,CursorHoldI * lua vim.lsp.diagnostic.show_line_diagnostics({focusable=false})]]

cmd([[augroup lsp]])
cmd([[autocmd!]])
cmd([[autocmd FileType scala setlocal omnifunc=v:lua.vim.lsp.omnifunc]])
cmd([[autocmd FileType scala,sbt lua require('metals').initialize_or_attach(metals_config)]])
cmd([[augroup end]])

local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }
for type, icon in pairs(signs) do
    local hl = "LspDiagnosticsSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
