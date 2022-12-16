require("hop").setup()

local wk = require("which-key")

wk.register({
  ["h"] = {
    name = "Hop action",
    ["l"] = { "<cmd>HopLine<cr>", "HopLine" },
    ["w"] = { "<cmd>HopWord<cr>", "HopWord" },
    ["c"] = {
      name = "HopChar",
      ["1"] = { "<cmd>HopChar1<cr>", "HopChar1" },
      ["2"] = { "<cmd>HopChar2<cr>", "HopChar2" },
    },
    ["p"] = { "<cmd>HopPattern<cr>", "HopPattern" },
  },
}, { prefix = "<leader>" })
-- place this in one of your configuration file(s)
vim.api.nvim_set_keymap(
  "",
  "f",
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>",
  {}
)
vim.api.nvim_set_keymap(
  "",
  "F",
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>",
  {}
)
vim.api.nvim_set_keymap(
  "",
  "t",
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<cr>",
  {}
)
vim.api.nvim_set_keymap(
  "",
  "T",
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<cr>",
  {}
)
