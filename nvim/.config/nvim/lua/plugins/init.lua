return {
  { "nvim-lua/plenary.nvim" },
  {
    "nvim-zh/colorful-winsep.nvim",
    enabled = true,
    event = "VimEnter",
    config = true,
  },

  {
    "danymat/neogen",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    cmd = "Neogen",
    config = {
      snippet_engine = "luasnip",
    },
  },

  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = true,
  },

  {
    "NvChad/nvim-colorizer.lua",
    config = true,
  },

  {
    "nacro90/numb.nvim",
    event = { "CmdlineEnter" },
    config = true,
  },

  {
    "folke/twilight.nvim",
    cmd = { "Twilight", "TwilightEnable", "TwilightDisable" },
  },
  { "folke/zen-mode.nvim", cmd = { "ZenMode" } },

  {
    "skywind3000/asyncrun.vim",
    cmd = { "AsyncRun", "AsyncStop", "AsyncReset" },
  },

  {
    "mrjones2014/legendary.nvim",
    enabled = false,
    config = true,
  },

  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    build = "cd app && pnpm install",
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
  },

  { "gpanders/editorconfig.nvim", event = "VeryLazy" },

  {
    "junegunn/fzf",
    lazy = true,
    build = function()
      vim.fn["fzf#install"]()
    end,
  },

  { "famiu/bufdelete.nvim" },

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
    config = true,
  },

  { "nvim-lua/popup.nvim", lazy = true },

  {
    "eandrju/cellular-automaton.nvim",
    cmd = "CellularAutomaton",
  },

  {
    "xiyaowong/transparent.nvim",
    enabled = false,
    config = function()
      require("transparent").setup({
        extra_groups = { "Pmenu", "Float", "NormalFloat" },
      })
      require("transparent").clear_prefix("BufferLine")
    end,
  },
}
