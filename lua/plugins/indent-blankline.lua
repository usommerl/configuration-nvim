return {
  {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      -- indent-blankline character.
      vim.g.indent_blankline_char = '▏'

      -- Disable indent-blankline on these pages.
      vim.g.indent_blankline_filetype_exclude = {'help', 'terminal', 'dashboard', 'packer', 'NvimTree'}
      vim.g.indent_blankline_buftype_exclude = {'terminal'}

      vim.g.indent_blankline_show_first_indent_level = false
    end
  }
}
