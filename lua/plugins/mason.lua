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

      local function typescript_organize_imports()
        local params = {
          command = "_typescript.organizeImports",
          arguments = { vim.api.nvim_buf_get_name(0) },
          title = ""
        }
        vim.lsp.buf.execute_command(params)
      end

      for _, lsp in pairs(servers) do
        local config = make_config()
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
        if lsp == "tsserver" then
          config.commands = {
            OrganizeImports = {
              typescript_organize_imports,
              description = "Organize Imports"
            }
          }
        end
        lspconfig[lsp].setup(config)
      end
    end
  }
}
