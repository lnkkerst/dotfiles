require("keymap.config")
-- require("legendary").setup()

local wk = require("which-key")

-- Plugin Trouble
wk.register({
  ["<A-t>"] = { "<cmd>TroubleToggle<cr>", "TroubleToggle" },
})

-- Plugin Aerial
wk.register({
  ["<A-a>"] = { "<cmd>AerialToggle<cr>", "Aerial" },
}, { mode = { "n", "i", "v" } })
-- Plugin Neoformat
wk.register({
  ["<M-S-f>"] = { "<cmd>Neoformat<cr>", "Neoformat" },
}, { mode = { "n", "i" } })

-- Save file
wk.register({
  ["<C-s>"] = { "<cmd>w<cr>", "Save file" },
}, { mode = { "n", "i" } })

-- Line move
wk.register({
  ["H"] = { "^", "Move to the first non-blank character" },
  ["L"] = { "g_", "Move to the latest non-blank character" },
}, { mode = { "n", "v" } })

-- Delete char without yank
wk.register({
  ["x"] = { '"_x', "Delete current char without yank" },
  ["X"] = { '"_X', "Delete prev char without yank" },
}, { mode = { "n", "v" } })

-- Visual paste without yank
wk.register({
  ["p"] = { '"_dP', "Visual paste without yank" },
}, { mode = "v" })

-- No highlight
wk.register({
  ["l"] = { "<cmd>noh<cr>", "noh" },
}, { prefix = "<leader>" })

-- Dap
wk.register({
  ["d"] = {
    name = "Dap for debug",
    ["u"] = { "<cmd>lua require('dapui').toggle()<cr>", "Toggle dap UI" },
    ["b"] = {
      "<cmd>lua require('dap').toggle_breakpoint()<cr>",
      "Toggle breakpoint",
    },
    ["r"] = { "<cmd>lua require('dap').continue()<cr>", "Dap Continue" },
    ["o"] = { "<cmd>lua require('dapui').open()<cr>", "Open dap UI" },
    ["c"] = { "<cmd>lua require('dapui').close()<cr>", "Close dap UI" },
  },
}, { prefix = "<leader>" })

-- Nvim tree
wk.register({
  ["<C-n>"] = { "<cmd>NvimTreeToggle<cr>", "NvimTreeToggle" },
})
