require("keymap.config")

-- Save file
vim.keymap.set(
  { "i", "x", "n", "s" },
  "<C-s>",
  "<cmd>w<cr><esc>",
  { desc = "Save File" }
)
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>")

-- Move in line
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

vim.keymap.set({ "", "!" }, "<C-c>", "<Esc>")

-- Copy and comment
vim.keymap.set(
  "n",
  "<leader>C",
  "yygccp",
  { desc = "Copy to a comment above", remap = true }
)
vim.keymap.set(
  "v",
  "<leader>C",
  "ygvgc`>p",
  { remap = true, desc = "Copy to a comment above" }
)

-- vim.keymap.set("i", "<S-cr>", "<esc>o")

-- Move in insert mode
vim.keymap.set("i", "<C-h>", "<left>")
vim.keymap.set("i", "<C-j>", "<down>")
vim.keymap.set("i", "<C-k>", "<up>")
vim.keymap.set("i", "<C-l>", "<right>")

-- -- Move line
-- vim.keymap.set("n", "<M-j>", "<cmd>move+1<cr>==")
-- vim.keymap.set("n", "<M-k>", "<cmd>move-2<cr>==")
-- vim.keymap.set("i", "<M-j>", "<esc><cmd>move+1<cr>==gi")
-- vim.keymap.set("i", "<M-k>", "<esc><cmd>move-2<cr>==gi")
-- vim.keymap.set("v", "<M-j>", "<esc><cmd>'<,'>move'>+1<cr>gv=gv")
-- vim.keymap.set("v", "<M-k>", "<esc><cmd>'<,'>move'<-2<cr>gv=gv")

-- Cmdline shortcuts
vim.keymap.set("c", "<C-a>", "<Home>")
vim.keymap.set("c", "<C-e>", "<End>")
