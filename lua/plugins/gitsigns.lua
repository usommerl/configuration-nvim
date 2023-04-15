return {
  {
    'lewis6991/gitsigns.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim'
    },
    tag = 'release',
    config = function() require('gitsigns').setup() end
  }
}
