return {
  {
    "stevearc/dressing.nvim",
    config = function()
      require("dressing").setup({
        input = {
          border = "single",
        },
        select = {
          enabled = true,
          backend = { "telescope", "fzf_lua", "fzf", "builtin", "nui" },
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
    end,
  },
}
