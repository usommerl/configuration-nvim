return {
  {
    'folke/trouble.nvim',
    dependencies = {
      { 'nvim-tree/nvim-web-devicons' },
      { 'folke/lsp-colors.nvim' },
    },
    cmd = 'Trouble',
    config = function()
      require('trouble').setup {
        auto_preview = false
      }
    end
  }
}
