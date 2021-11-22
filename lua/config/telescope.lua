local present, telescope = pcall(require, 'telescope')
if not present or not (type(telescope) == 'table') then
  return
end

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
      sort_lastused = true,
      previewer = false,
      mappings = {
        i = { ['<c-x>'] = require('telescope.actions').delete_buffer },
        n = { ['<c-x>'] = require('telescope.actions').delete_buffer }
      }
    }
  }
}

telescope.load_extension('fzf')
telescope.load_extension('metals')
telescope.load_extension('zoxide')
require('telescope._extensions.zoxide.config').setup({
  list_command = 'zoxide query -l --all'
})
