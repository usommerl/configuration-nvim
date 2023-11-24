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
      cmd([[autocmd BufWritePre *.scala,build.sbt,*.lua,*.rs,*.json,*.nix,*.ts lua vim.lsp.buf.format()]])
      cmd([[augroup end]])

      require("mason").setup()
      require("mason-lspconfig").setup({
        automatic_installation = true,
      })

      local lspconfig = require('lspconfig')
      local servers = {
        'angularls',
        'bashls',
        'clangd',
        'dartls',
        'jsonls',
        'ltex',
        'lua_ls',
        'marksman',
        'pylsp',
        'rnix',
        'rust_analyzer',
        'tsserver',
        'yamlls',
      }

      local on_attach = function(client, bufnr)
        local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
        buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

        if client.name == "yamlls" then
          client.server_capabilities.documentFormattingProvider = true
        end
      end

      local function make_config()
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities.textDocument.completion.completionItem.snippetSupport = true
        capabilities.textDocument.foldingRange = {
          dynamicRegistration = false,
          lineFoldingOnly = true
        }
        return {
          capabilities = capabilities,
          on_attach = on_attach,
        }
      end

      for _, lsp in pairs(servers) do
        local config = make_config()
        if lsp == "ltex" then
          config["filetypes"] = { "markdown", "text" }
          config["flags"] = { debounce_text_changes = 300 }
        end
        if lsp == "yamlls" then
          config.settings = {
            yaml = {
              format = { enable = true },
              keyOrdering = false,
            }
          }
        end
        if lsp == "pylsp" then
          config.settings = {
            pylsp = {
              plugins = {
                pycodestyle = {
                  maxLineLength = 120,
                },
                flake8 = {
                  maxLineLength = 120,
                }
              }
            }
          }
        end
        lspconfig[lsp].setup(config)
      end
    end
  }
}
