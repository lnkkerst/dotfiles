require("noice").setup({
  cmdline = {
    view = "cmdline",
    icons = {
      ["/"] = { icon = " ", hl_group = "DiagnosticWarn" },
      ["?"] = { icon = " ", hl_group = "DiagnosticWarn" },
      [":"] = { icon = " ", hl_group = "DiagnosticInfo", firstc = false },
    },
  },
  messages = {
    enabled = true,
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
        enabled = true,
      },
      opts = { border = "single" },
    },
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
})

require("telescope").load_extension("noice")
