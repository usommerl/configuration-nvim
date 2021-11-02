local present, telescope = pcall(require, 'telescope')
if not present then
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
    },
  }
}

telescope.load_extension('fzf')

telescope.load_extension('zoxide')
require('telescope._extensions.zoxide.config').setup({
  list_command = 'zoxide query -l --all'
})
