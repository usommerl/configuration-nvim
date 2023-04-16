return {
  {
    'tpope/vim-fugitive',
    version = '^3',
    config = function()
      vim.api.nvim_create_autocmd(
        'FileType',
        {
          pattern = { 'fugitive', 'git' },
          command = [[nnoremap <buffer><silent>q :close<cr>]]
        }
      )
    end
  }
}
