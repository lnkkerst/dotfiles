require("keymap.config")
-- require("legendary").setup()

local wk = require("which-key")

-- Save file
wk.add({
  "<C-s>",
  "<cmd>w<cr>",
  desc = "Save file",
  mode = { "n", "i" },
})

-- Line move
wk.add({
  mode = { "n", "v" },
  { "H", "^", desc = "Move to the first non-blank character" },
  { "L", "g_", desc = "Move to the latest non-blank character" },
})

-- Delete char without yank
wk.add({
  mode = { "n", "v" },
  { "x", '"_x', desc = "Delete current char without yank" },
  { "X", '"_X', desc = "Delete prev char without yank" },
})

-- Visual paste without yank
wk.add({
  mode = "v",
  { "p", '"_dP', desc = "Visual paste without yank" },
})

-- No highlight
wk.add({
  mode = "n",
  { "<leader>l", "<cmd>noh<cr>", desc = "noh" },
})
