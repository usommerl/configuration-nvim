return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      vim.opt.foldmethod = "expr"
      vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
      vim.opt.foldenable = true
      vim.opt.foldlevel = 99

      require("nvim-treesitter.configs").setup(
        {
          ensure_installed = "all",
          highlight = { enable = true },
          incremental_selection = { enable = true },
          indent = { enable = true }
        })
    end
  }
}
