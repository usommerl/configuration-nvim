return {
  {
    'akinsho/bufferline.nvim',
    version = "v4.*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      vim.opt.termguicolors = true
      require("bufferline").setup {
        options = {
          mode = "tabs",
          always_show_bufferline = false
        }
      }
    end
  }
}
