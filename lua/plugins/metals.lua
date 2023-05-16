return {
  {
    'scalameta/nvim-metals',
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope.nvim' },
    },
    config = function()
      metals_config = require('metals').bare_config()
      metals_config.init_options.statusBarProvider = 'on'
      metals_config.settings = {
        showImplicitArguments = true,
        showInferredType = true,
      }

      local cmd = vim.cmd
      cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float({focusable=false})]]
      cmd([[augroup lsp]])
      cmd([[autocmd!]])
      cmd([[autocmd FileType scala setlocal omnifunc=v:lua.vim.lsp.omnifunc]])
      cmd([[autocmd FileType scala,sbt lua require('metals').initialize_or_attach(metals_config)]])
      cmd([[augroup end]])

      require('telescope').load_extension('metals')
    end
  }
}
