return {
  { "nvim-lua/plenary.nvim", lazy = true },
  { "nvim-lua/popup.nvim", lazy = true },

  {
    "nvim-zh/colorful-winsep.nvim",
    event = { "WinLeave" },
    opts = {},
  },

  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    vscode = true,
    opts = {},
  },

  {
    "uga-rosa/ccc.nvim",
    event = "VeryLazy",
    opts = {
      highlighter = {
        auto_enable = true,
        lsp = true,
      },
    },
  },

  {
    "nacro90/numb.nvim",
    event = { "CmdlineEnter" },
    vscode = true,
    opts = {},
  },

  {
    "skywind3000/asyncrun.vim",
    cmd = { "AsyncRun", "AsyncStop", "AsyncReset" },
    init = function()
      vim.g.asyncrun_open = 6
    end,
  },

  {
    "stevearc/aerial.nvim",
    cmd = {
      "AerialToggle",
      "AerialGo",
      "AerialInfo",
      "AerialNavToggle",
      "AerialNext",
      "AerialPrev",
      "AerialOpen",
      "AerialClose",
      "AerialNavOpen",
      "AerialNavClose",
      "AerialOpenAll",
      "AerialCloseAll",
    },
    keys = {
      {
        "<A-a>",
        "<cmd>AerialToggle<cr>",
        desc = "Toggle Aerial",
      },
    },
    opts = {},
  },

  {
    "tzachar/highlight-undo.nvim",
    opts = {},
  },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },
}
