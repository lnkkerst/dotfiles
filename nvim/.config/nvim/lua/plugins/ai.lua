---@type LazySpec
return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = { enabled = true, auto_trigger = true },
      panel = { enabled = false },
    },
  },

  {
    "olimorris/codecompanion.nvim",
    cmd = {
      "CodeComponion",
      "CodeComponionChat",
      "CodeComponionActions",
      "CodeComponionCmd",
    },
    keys = {
      { "<leader>aa", "<cmd>CodeCompanionActions<cr>" },
      { "<leader>ai", "<cmd>CodeCompanion<cr>", mode = { "n", "x" } },
      { "<leader>ac", "<cmd>CodeCompanionChat Toggle<cr>" },
      { "ga", "<cmd>CodeCompanionChat Add<cr>", mode = { "x" } },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {},
    config = function(_, opts)
      require("plugins.codecompanion.fidget_spinner"):init()
      require("codecompanion").setup(opts)
    end,
  },
}
