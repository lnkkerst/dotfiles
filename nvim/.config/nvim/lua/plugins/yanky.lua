return {
  {
    "gbprod/yanky.nvim",
    -- event = "VimEnter",
    config = function()
      require("yanky").setup({})

      vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
      vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
      vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
      vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")
      vim.keymap.set({ "n", "x" }, "y", "<Plug>(YankyYank)")
      vim.keymap.set("n", "<M-S-n>", "<Plug>(YankyCycleForward)")
      vim.keymap.set("n", "<M-S-p>", "<Plug>(YankyCycleBackward)")
    end,
  },
}
