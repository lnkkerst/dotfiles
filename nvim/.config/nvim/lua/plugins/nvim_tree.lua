require("nvim-tree").setup({
  auto_reload_on_write = true,

  renderer = {
    icons = {
      glyphs = {
        git = {
          unstaged = "",
          staged = "",
          unmerged = "",
          renamed = "➜",
          untracked = "",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
})

local wk = require("which-key")

wk.register({
  ["<C-n>"] = { "<cmd>NvimTreeToggle<cr>", "NvimTreeToggle" },
})
