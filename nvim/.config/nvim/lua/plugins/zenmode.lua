return {
  {
    "folke/zen-mode.nvim",
    cmd = { "ZenMode" },
    keys = {
      {
        "<M-f>",
        function()
          require("zen-mode").toggle()
        end,
        "Toggle zen mode",
      },
    },
    opts = {
      window = {
        width = 0.9,
        height = 1,
      },
      plugins = {
        twilight = { enabled = false },
      },
    },
  },

  {
    "folke/twilight.nvim",
    cmd = { "Twilight", "TwilightEnable", "TwilightDisable" },
  },
}
