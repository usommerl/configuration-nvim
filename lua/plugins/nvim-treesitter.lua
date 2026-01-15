return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup(
        {
          ensure_installed = {
            'angular',
            'bash',
            'css',
            'csv',
            'dart',
            'java',
            'json',
            'jsonnet',
            'lua',
            'markdown',
            'nix',
            'python',
            'ruby',
            'rust',
            'scala',
            'scala',
            'scss',
            'toml',
            'tsv',
            'tsx',
            'typescript',
            'vim',
            'vue',
            'xml',
            'yaml',
            'zig',
          },
          highlight = {
            enable = true,
            disable = { 'gitcommit' }
          },
          incremental_selection = { enable = true },
          indent = { enable = true }
        })
    end
  }
}
