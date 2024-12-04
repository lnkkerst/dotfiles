return {
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    vscode = true,
    opts = {
      modes = { search = { enabled = false }, char = { jump_labels = true } },
    },
    config = function(_, opts)
      require("flash").setup(opts)
      vim.api.nvim_create_user_command("FlashSearch", function()
        require("flash").toggle()
      end, { desc = "Toggle flash search" })
    end,
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "S",
        mode = { "n", "x", "o" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
      {
        "<leader>j",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump({
            search = { mode = "search", max_length = 0 },
            label = { after = { 0, 0 } },
            pattern = "^",
          })
        end,
        { desc = "Flash line" },
      },
      {
        "r",
        mode = "o",
        function()
          require("flash").remote()
        end,
        desc = "Remote Flash",
      },
      {
        "R",
        mode = { "o", "x" },
        function()
          require("flash").treesitter_search()
        end,
        desc = "Treesitter Search",
      },
      { "f" },
      { "F" },
      { "t" },
      { "T" },
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
}
