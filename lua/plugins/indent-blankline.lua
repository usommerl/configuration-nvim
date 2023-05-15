return {
  {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require("indent_blankline").setup {
        -- indent-blankline character.
        indent_blankline_char = '▏',

        -- Disable indent-blankline on these pages.
        indent_blankline_filetype_exclude = { 'help', 'terminal', 'dashboard', 'packer', 'NvimTree' },
        indent_blankline_buftype_exclude = { 'terminal' },

        indent_blankline_show_first_indent_level = true,
      }
    end
  }
}
