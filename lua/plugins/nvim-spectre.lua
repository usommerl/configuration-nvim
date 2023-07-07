return {
  "nvim-pack/nvim-spectre",
  requires = "nvim-lua/plenary.nvim",
  config = function()
    vim.api.nvim_create_autocmd(
      'FileType',
      {
        pattern = { 'spectre_panel' },
        command = [[nnoremap <buffer><silent>q :close<cr>]]
      }
    )
  end
}
