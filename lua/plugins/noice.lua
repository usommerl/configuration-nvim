return {
  {
    "folke/noice.nvim",
    event = "VimEnter",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require("noice").setup({
        presets = {
          command_palette = true,
          lsp_doc_border = true
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
                { find = "; before #",  event = "msg_show", kind = "" },
                { find = "; after #",   event = "msg_show", kind = "" },
                { find = "more lines",  event = "msg_show", kind = "" },
                { find = "fewer lines", event = "msg_show", kind = "" },
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
