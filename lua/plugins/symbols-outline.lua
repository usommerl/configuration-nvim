return {
  {
    'simrat39/symbols-outline.nvim',
    cmd = 'SymbolsOutline',
    config = function()
      require("symbols-outline").setup({
        show_numbers = true,
        show_relative_numbers = true,
      })
    end
  }
}
