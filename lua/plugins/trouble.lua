return {
  {
    'folke/trouble.nvim',
    dependencies = {
      { 'nvim-tree/nvim-web-devicons' },
      { 'folke/lsp-colors.nvim' },
    },
    cmd = 'TroubleToggle',
    config = function()
      require('trouble').setup {
        auto_preview = false,
        use_diagnostic_signs = true
      }
    end
  }
}
