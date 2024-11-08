return {
  { "nvim-lua/plenary.nvim" },

  {
    "nvim-zh/colorful-winsep.nvim",
    event = "VimEnter",
    opts = {},
  },

  {
    "danymat/neogen",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    cmd = "Neogen",
    opts = {
      -- snippet_engine = "luasnip",
    },
  },

  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    vscode = true,
    opts = {},
  },

  {
    "uga-rosa/ccc.nvim",
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
    config = true,
  },

  {
    "skywind3000/asyncrun.vim",
    cmd = { "AsyncRun", "AsyncStop", "AsyncReset" },
    config = function()
      vim.g.asyncrun_open = 6
    end,
  },

  {
    "mrjones2014/legendary.nvim",
    enabled = false,
    priority = 10000,
    lazy = false,
    opts = {
      { extensions = { lazy_nvim = true } },
    },
  },

  {
    "sindrets/diffview.nvim",
    cmd = {
      "DiffviewOpen",
      "DiffviewClose",
      "DiffviewLog",
      "DiffviewRefresh",
      "DiffviewFocusFiles",
      "DiffviewFileHistory",
      "DiffviewToggleFiles",
    },
  },

  {
    "sbdchd/neoformat",
    cmd = "Neoformat",
    keys = {
      {
        "<M-S-f>",
        "<cmd>Neoformat<cr>",
        desc = "Neoformat",
      },
    },
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

  { "nvim-lua/popup.nvim", lazy = true },

  {
    "eandrju/cellular-automaton.nvim",
    cmd = "CellularAutomaton",
  },

  {
    "tzachar/highlight-undo.nvim",
    opts = {},
  },

  {
    "stevearc/oil.nvim",
    opts = {
      columns = {
        "icon",
        "permissions",
        "size",
        "mtime",
      },
    },
  },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },
}
