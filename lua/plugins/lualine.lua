return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup {
        options = {
          component_separators = ''
        },
        sections = {
          lualine_c = { 'filename', 'g:metals_status' },
          lualine_x = { 'encoding', { 'fileformat', icons_enabled = false }, 'filetype' },
        },
        extensions = { 'nvim-tree' }
      }
    end
  }
}
