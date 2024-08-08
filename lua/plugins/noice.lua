return {
  {
    "folke/noice.nvim",
    event = "VimEnter",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "hrsh7th/nvim-cmp",
      {
        "rcarriga/nvim-notify",
        opts = {
          render = 'wrapped-compact',
          stages = 'static',
          max_height = function()
            return math.floor(vim.o.lines * 0.75)
          end,
          max_width = function()
            return math.floor(vim.o.columns * 0.75)
          end,
        }
      }
    },
    config = function()
      require("noice").setup({
        lsp = {
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
          },
          presets = {
            command_palette = true,
            lsp_doc_border = true
          }
        },
        routes = {
          {
            filter = { find = "written", event = "msg_show", kind = "" },
            opts = { skip = true },
          },
          {
            view = "mini",
            filter = {
              any = {
                { find = "; before #",   event = "msg_show", kind = "" },
                { find = "; after #",    event = "msg_show", kind = "" },
                { find = "more lines",   event = "msg_show", kind = "" },
                { find = "fewer lines",  event = "msg_show", kind = "" },
                { find = "lines yanked", event = "msg_show", kind = "" },
              },
            },
          },
        },
      })

      vim.keymap.set({ "n", "i", "s" }, "<c-f>", function()
        if not require("noice.lsp").scroll(4) then
          return "<c-f>"
        end
      end, { silent = true, expr = true })

      vim.keymap.set({ "n", "i", "s" }, "<c-b>", function()
        if not require("noice.lsp").scroll(-4) then
          return "<c-b>"
        end
      end, { silent = true, expr = true })
    end
  }
}
