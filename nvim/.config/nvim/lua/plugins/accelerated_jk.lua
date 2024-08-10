return {
  {
    "rainbowhxch/accelerated-jk.nvim",
    event = "VeryLazy",
    config = function()
      local wk = require("which-key")
      wk.add({
        mode = { "n" },
        noremap = true,
        { "j", "<Plug>(accelerated_jk_gj)", desc = "accelerate j" },
        { "k", "<Plug>(accelerated_jk_gk)", desc = "accelerate k" },
      })
    end,
  },
}
