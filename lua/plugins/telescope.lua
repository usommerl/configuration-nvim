return {
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      { 'nvim-telescope/telescope-frecency.nvim' },
      { 'jvgrootveld/telescope-zoxide' },
      { 'tami5/sqlite.lua' }
    },
    cmd = 'Telescope',
    config = function()
      local telescope = require('telescope')

      telescope.setup {
        defaults = {
          layout_config = {
            horizontal = {
              width = 0.9
            }
          }
        },
        pickers = {
          colorscheme = { theme = 'dropdown' },
          buffers = {
            sort_mru = true,
            previewer = false,
            mappings = {
              i = { ['<c-x>'] = require('telescope.actions').delete_buffer },
              n = { ['<c-x>'] = require('telescope.actions').delete_buffer }
            }
          }
        }
      }

      telescope.load_extension('fzf')
      telescope.load_extension('zoxide')
      telescope.load_extension('frecency')

      require('telescope._extensions.zoxide.config').setup({
        list_command = 'zoxide query -l --all'
      })
    end
  }
}
