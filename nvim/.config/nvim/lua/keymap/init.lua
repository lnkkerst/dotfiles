require("keymap.config")

-- Save file
vim.keymap.set(
  { "i", "x", "n", "s" },
  "<C-s>",
  "<cmd>w<cr><esc>",
  { desc = "Save File" }
)

-- Line move
vim.keymap.set(
  { "n", "v" },
  "H",
  "^",
  { desc = "Move to the first non-blank character" }
)
vim.keymap.set(
  { "n", "v" },
  "L",
  "g_",
  { desc = "Move to the latest non-blank character" }
)

-- Delete char without yank
vim.keymap.set(
  { "n", "v" },
  "x",
  '"_x',
  { desc = "Delete current char without yank" }
)
vim.keymap.set(
  { "n", "v" },
  "X",
  '"_X',
  { desc = "Delete prev char without yank" }
)

-- Visual paste without yank
vim.keymap.set({ "v" }, "p", '"_dP', { desc = "Visual paste without yank" })

-- Clear highlight
vim.keymap.set({ "n" }, "<leader>l", "<cmd>noh<cr><esc>", { desc = "noh" })

-- Clear search with <esc>
vim.keymap.set(
  { "i", "n" },
  "<esc>",
  "<cmd>noh<cr><esc>",
  { desc = "Escape and Clear hlsearch" }
)

-- Quickfix
vim.keymap.set("n", "<leader>qo", ":copen<cr>", { desc = "Open quickfix" })
vim.keymap.set("n", "<leader>qc", ":cclose<cr>", { desc = "Close quickfix" })
vim.keymap.set("n", "<leader>qn", ":cnext<cr>", { desc = "Next quickfix item" })
vim.keymap.set(
  "n",
  "<leader>qp",
  ":cprevious<cr>",
  { desc = "Previous quickfix item" }
)
