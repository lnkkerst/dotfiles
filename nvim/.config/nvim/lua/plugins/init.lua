return {
  { "nvim-lua/plenary.nvim" },

  {
    "nvim-zh/colorful-winsep.nvim",
    enabled = true,
    -- event = "VimEnter",
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
    -- event = "InsertEnter",
    config = true,
  },

  {
    "NvChad/nvim-colorizer.lua",
    config = true,
  },

  {
    "nacro90/numb.nvim",
    -- event = { "CmdlineEnter" },
    config = true,
  },

  { "folke/twilight.nvim" },
  { "folke/zen-mode.nvim" },
  { "andymass/vim-matchup" },

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
    "sindrets/diffview.nvim",--[[  cmd = "Diffview*" ]]
  },

  {
    "sbdchd/neoformat",
    cmd = "Neoformat",
  },

  { "gpanders/editorconfig.nvim" },

  {
    "junegunn/fzf",
    build = function()
      vim.fn["fzf#install"]()
    end,
  },

  { "famiu/bufdelete.nvim" },

  {
    "stevearc/aerial.nvim",
    cmd = { "AerialToggle" },
    config = true,
  },

  { "nvim-lua/popup.nvim" },

  {
    "eandrju/cellular-automaton.nvim",
    cmd = "CellularAutomaton",
  },
}
