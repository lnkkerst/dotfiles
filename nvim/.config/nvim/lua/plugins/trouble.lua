return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = "Trouble",
  opts = {},
  keys = {
    {
      "<A-t>",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Toggle Trouble diagnostics",
    },
  },
}
