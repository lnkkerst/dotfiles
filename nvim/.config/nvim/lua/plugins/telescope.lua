return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = { "Telescope" },
    lazy = true,
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    keys = {
      {
        "<leader>ff",
        "<cmd>Telescope<cr>",
        desc = "Telescope builtins",
      },
      {
        "<leader>fn",
        "<cmd>Telescope notify<cr>",
        desc = "Telescope notify",
      },
      {
        "<leader>fb",
        "<cmd>Telescope buffers<cr>",
        desc = "Telescope buffers",
      },
      { "<leader>fm", "<cmd>Telescope marks<cr>", desc = "Telescope marks" },
      {
        "<leader>fg",
        "<cmd>Telescope live_grep<cr>",
        desc = "Telescope live grep",
      },
      {
        "<leader>fc",
        "<cmd>Telescope current_buffer_fuzzy_find<cr>",
        desc = "Telescope current buffer fuzzy find",
      },
      {
        "<leader>fp",
        "<cmd>Telescope projects<cr>",
        desc = "Telescope list projects",
      },
      {
        "<leader>fj",
        "<cmd>Telescope jumplist<cr>",
        desc = "Telescope show jumplist",
      },
      {
        "<C-p>",
        "<cmd>Telescope find_files<cr>",
        desc = "Find files",
      },
    },
    config = function()
      local telescope = require("telescope")

      telescope.setup({
        defaults = {
          prompt_prefix = " ",
          selection_caret = " ",
          layout_config = {
            horizontal = { prompt_position = "bottom", results_width = 0.6 },
            vertical = { mirror = false },
          },
          winblend = 0,
          border = {},
          borderchars = {
            "─",
            "│",
            "─",
            "│",
            "┌",
            "┐",
            "┘",
            "└",
          },
          color_devicons = true,
          use_less = true,
          set_env = { ["COLORTERM"] = "truecolor" },
        },
      })

      telescope.load_extension("fzf")
      telescope.load_extension("notify")
      telescope.load_extension("yank_history")
      telescope.load_extension("projects")
      telescope.load_extension("refactoring")

      local wk = require("which-key")
      wk.add({ "<leader>f", group = "Telescope" })
    end,
  },
}
