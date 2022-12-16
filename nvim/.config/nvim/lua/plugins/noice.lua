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
    view_search = false,
  },
  popupmenu = {
    enabled = true,
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
  },
})
