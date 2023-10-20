return {
  {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require("ibl").setup {
        -- indent-blankline character.
        indent = { char = '▏' },
        scope = {
          show_start = false,
          enabled = true,
          exclude = { language = { 'scala' } }
        },
        exclude = {
          filetypes = { 'help', 'terminal', 'dashboard', 'packer', 'NvimTree' },
          buftypes = { 'terminal' },
        }
        -- indent_blankline_show_first_indent_level = true,
      }
    end
  }
}
