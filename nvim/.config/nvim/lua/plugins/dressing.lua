require("dressing").setup({
  input = {
    border = "single",
  },
  select = {
    enabled = true,
    telescope = {
      border = {},
      borderchars = {
        "─",
        "│",
        "─",
        "│",
        "┌",
        "┐",
        "┘",
        "└",
      },
    },
  },
})
