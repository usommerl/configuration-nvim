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
        defaultBspToBuildTool = true,
        showImplicitArguments = true,
        showInferredType = true,
        serverVersion = "1.6.4",
        inlayHints = {
          -- I only enable inlay hints to display the results in worksheets. (See autocmd below)
          -- Hence, I disable most of the features to reduce the noise.
          byNameParameters = { enable = false },
          hintsInPatternMatch = { enable = false },
          implicitArguments = { enable = false },
          implicitConversions = { enable = false },
          inferredTypes = { enable = false },
          typeParameters = { enable = false },
        }
      }

      vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead", "BufEnter" }, {
        pattern = { "*.worksheet.sc" },
        callback = function()
          vim.lsp.inlay_hint.enable(true)
        end,
        group = nvim_metals_group,
      })

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
