require("bufferline").setup({
  options = {
    mod = "buffers",
    numbers = "ordinal",
    diagnostics = "nvim_lsp",
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        text_align = "center",
        padding = 1,
      },
    },
  },
  highlights = require("catppuccin.groups.integrations.bufferline").get(),
})
