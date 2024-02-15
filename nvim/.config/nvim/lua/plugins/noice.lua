return {
  {
    "folke/noice.nvim",
    enabled = false,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require("noice").setup({
        cmdline = {
          view = "cmdline",
          icons = {
            ["/"] = { icon = " ", hl_group = "DiagnosticWarn" },
            ["?"] = { icon = " ", hl_group = "DiagnosticWarn" },
            [":"] = {
              icon = " ",
              hl_group = "DiagnosticInfo",
              firstc = false,
            },
          },
        },
        messages = {
          enabled = true,
          view_search = false,
        },
        popupmenu = {
          enabled = false,
          backend = "cmp",
        },
        lsp = {
          hover = {
            enabled = true,
            opts = { border = "single" },
          },
          signature = {
            enabled = true,
            auto_open = {
              enabled = false,
            },
            opts = { border = "single" },
          },
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            -- ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        },
      })
    end,
  },
}
