return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    config = function()
      require('nvim-treesitter').install({
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
      }):wait(300000)
    end
  }
}
