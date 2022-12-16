require("telescope").setup({
  defaults = {
    prompt_prefix = " ",
    selection_caret = " ",
    layout_config = {
      horizontal = { prompt_position = "bottom", results_width = 0.6 },
      vertical = { mirror = false },
    },
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    file_sorter = require("telescope.sorters").get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    path_display = { "absolute" },
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
  extensions = {
    frecency = {
      show_scores = true,
      show_unindexed = true,
      ignore_patterns = { "*.git/*", "*/tmp/*" },
    },
  },
})

require("telescope").load_extension("fzf")
require("telescope").load_extension("frecency")

local wk = require("which-key")

wk.register({
  ["f"] = {
    name = "+Telescope",
    ["f"] = { "<cmd>Telescope find_files<cr>", "Telescope find files" },
    ["r"] = { "<cmd>Telescope frecency<cr>", "Telescope frecency" },
    ["n"] = { "<cmd>Telescope notify<cr>", "Telescope notify" },
    ["b"] = { "<cmd>Telescope buffers<cr>", "Telescope buffers" },
    ["m"] = { "<cmd>Telescope marks<cr>", "Telescope marks" },
    ["t"] = { "<cmd>Telescope<cr>", "Telescope buildin" },
    ["g"] = { "<cmd>Telescope live_grep<cr>", "Telescope live grep" },
    ["c"] = {
      "<cmd>Telescope current_buffer_fuzzy_find<cr>",
      "Telescope current_buffer_fuzzy_find",
    },
  },
}, { prefix = "<leader>" })
wk.register({
  ["<C-p>"] = { "<cmd>Telescope find_files<cr>", "Find files" },
})
