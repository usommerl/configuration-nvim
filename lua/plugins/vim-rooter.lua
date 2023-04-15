return {
  {
    'airblade/vim-rooter',
    event = "VimEnter",
    config = function()
      vim.g.rooter_silent_chdir = 1
    end
  }
}
