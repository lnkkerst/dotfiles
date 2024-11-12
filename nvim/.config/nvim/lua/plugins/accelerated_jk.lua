return {
  {
    "rainbowhxch/accelerated-jk.nvim",
    event = "VeryLazy",
    vscode = true,
    keys = {
      {
        "j",
        "<Plug>(accelerated_jk_gj)",
        desc = "accelerate j",
        mode = { "n" },
      },
      {
        "k",
        "<Plug>(accelerated_jk_gk)",
        desc = "accelerate k",
        mode = { "n" },
      },
    },
  },
}
