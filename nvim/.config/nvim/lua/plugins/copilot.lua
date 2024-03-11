return {
  {
    "zbirenbaum/copilot.lua",
    -- event = "InsertEnter",
    lazy = true,
    config = function()
      require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
      })
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    lazy = true,
    dependencies = { "copilot.lua" },
    config = true,
  },
}
