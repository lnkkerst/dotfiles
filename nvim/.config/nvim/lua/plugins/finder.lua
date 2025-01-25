---@module 'lazy.nvim'
---@type LazySpec
return {
  {
    "nvim-telescope/telescope.nvim",
    enabled = false,
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
      -- {
      --   "<leader>fn",
      --   "<cmd>Telescope notify<cr>",
      --   desc = "Telescope notify",
      -- },
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
      local actions = require("telescope.actions")

      telescope.setup({
        defaults = {
          prompt_prefix = "   ",
          selection_caret = "   ",
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
          mappings = {
            i = {
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
            },
          },
        },
      })

      telescope.load_extension("fzf")
      -- telescope.load_extension("yank_history")
      telescope.load_extension("projects")
      telescope.load_extension("refactoring")
      -- telescope.load_extension("notify")

      local wk = require("which-key")
      wk.add({ "<leader>f", group = "Telescope" })
    end,
  },

  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = { "FzfLua" },
    keys = {
      { "<leader>ff", "<cmd>FzfLua<cr>" },
      { "<leader>fb", "<cmd>FzfLua buffers<cr>" },
      { "<leader>fg", "<cmd>FzfLua live_grep<cr>" },
      { "<leader>fm", "<cmd>FzfLua marks<cr>" },
      { "<leader>fj", "<cmd>FzfLua jumps<cr>" },
      { "<C-p>", "<cmd>FzfLua files<cr>" },
    },
    opts = {
      { "telescope" },
      winopts = { border = "single", preview = { border = "single" } },
    },
    config = function(_, opts)
      local fzf = require("fzf-lua")
      fzf.setup(opts)
      fzf.register_ui_select()
    end,
  },
}
