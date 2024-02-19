return {
  {
    "nvim-telescope/telescope.nvim",
    -- cmd = { "Telescope" },
    -- lazy = true,
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      -- {
      --   "nvim-telescope/telescope-frecency.nvim",
      --   dependencies = { "kkharji/sqlite.lua" },
      -- },
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
          -- file_previewer = require("telescope.previewers").vim_buffer_cat.new,
          -- grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
          -- qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
          -- file_sorter = require("telescope.sorters").get_fuzzy_file,
          -- file_ignore_patterns = {},
          -- generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
          -- path_display = { "absolute" },
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
      -- telescope.load_extension("frecency")
      telescope.load_extension("notify")
      telescope.load_extension("yank_history")
      telescope.load_extension("projects")
      telescope.load_extension("refactoring")

      require("which-key").register({
        ["<leader>f"] = {
          name = "+Telescope",
          ["f"] = { "<cmd>Telescope<cr>", "Telescope builtins" },
          -- ["r"] = { "<cmd>Telescope frecency<cr>", "Telescope frecency" },
          ["n"] = { "<cmd>Telescope notify<cr>", "Telescope notify" },
          ["b"] = { "<cmd>Telescope buffers<cr>", "Telescope buffers" },
          ["m"] = { "<cmd>Telescope marks<cr>", "Telescope marks" },
          ["g"] = { "<cmd>Telescope live_grep<cr>", "Telescope live grep" },
          ["c"] = {
            "<cmd>Telescope current_buffer_fuzzy_find<cr>",
            "Telescope current_buffer_fuzzy_find",
          },
          ["p"] = {
            "<cmd>Telescope projects<cr>",
            "Telescope list projects",
          },
          ["j"] = { "<cmd>Telescope jumplist<cr>", "Telescope show jumplist" },
        },
        ["<C-p>"] = { "<cmd>Telescope find_files<cr>", "Find files" },
      })
    end,
  },
}
