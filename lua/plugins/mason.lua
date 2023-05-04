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
      cmd([[autocmd BufWritePre *.scala,*.lua,*.rs,*.json,*.yaml,*.yml lua vim.lsp.buf.format()]])
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


      local on_attach = function(client, bufnr)
        local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
        buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

        if client.name == "yamlls" then
          client.server_capabilities.documentFormattingProvider = true
        end

        if client.server_capabilities.document_highlight then
          vim.api.nvim_exec([[
            augroup lsp_document_highlight
            autocmd! * <buffer>
            autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()
            autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()
            autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
            augroup END
            ]],
            false)
        end
      end

      local function make_config()
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities.textDocument.completion.completionItem.snippetSupport = true
        return {
          capabilities = capabilities,
          on_attach = on_attach,
        }
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
        lspconfig[lsp].setup(config)
      end
    end
  }
}
