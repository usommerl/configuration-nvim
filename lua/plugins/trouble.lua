return {
  {
    'folke/trouble.nvim',
    dependencies = {
      { 'kyazdani42/nvim-web-devicons' },
      { 'folke/lsp-colors.nvim' },
    },
    cmd = 'TroubleToggle',
    config = function() require('trouble').setup() end
  }
}
