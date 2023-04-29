return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig"
    },
    build = ":MasonUpdate",
    config = function()
      local cmd = vim.cmd
      cmd([[augroup fmt]])
      cmd([[autocmd!]])
      cmd([[autocmd BufWritePre *.scala,*.lua,*.rs,*.json lua vim.lsp.buf.format()]])
      cmd([[augroup end]])

      require("mason").setup()
      require("mason-lspconfig").setup({
        automatic_installation = true,
      })

      local lspconfig = require('lspconfig')
      local servers = {
        'rust_analyzer',
        'tsserver',
        'pyright',
        'marksman',
        'lua_ls',
        'jsonls',
        'angularls',
        'rnix',
        'yamlls',
        'dartls'
      }

      for _, lsp in pairs(servers) do
        lspconfig[lsp].setup {
          on_attach = on_attach,
        }
      end

      lspconfig.yamlls.setup {
        settings = {
          yaml = {
            keyOrdering = false,
          }
        },
      }
    end
  }
}
