require("keymap.config")
require("legendary").setup()

local wk = require("which-key")

-- Plugin Trouble
wk.register({
  ["<A-t>"] = { "<cmd>TroubleToggle<cr>", "TroubleToggle" },
})

-- Plugin Symbols-outline
wk.register({
  ["<A-s>"] = { "<cmd>SymbolsOutline<cr>", "Symbols outline" },
})

-- Plugin Aerial
local aerial = {
  ["<A-a>"] = { "<cmd>AerialToggle<cr>", "Aerial" },
}
wk.register(aerial, { mode = { "n" } })
wk.register(aerial, { mode = { "i" } })
wk.register(aerial, { mode = { "x" } })

-- Plugin easy align
local easy_align = {
  ["ga"] = {
    "<Plug>(EasyAlign)",
    "EasyAlign",
  },
}
wk.register(easy_align, { mode = "n" })
wk.register(easy_align, { mode = "x" })

wk.register({
  ["<M-S-f>"] = { "<cmd>Neoformat<cr>", "Neoformat" },
}, { mode = "n" })

wk.register({
  ["<M-S-f>"] = { "<cmd>Neoformat<cr>", "Neoformat" },
}, { mode = "i" })

-- Plugin fcitx5-ui
local fcitx5_ui = {
  ["<A-i>"] = {
    "<cmd>lua require'fcitx5-ui'.toggle()<cr>",
    "Fcitx5-ui toggle",
  },
}
wk.register(fcitx5_ui, { mode = "i" })
wk.register(fcitx5_ui, { mode = "n" })

local control = {
  ["<C-s>"] = { "<cmd>w<cr>", "Save file" },
}
wk.register(control)
wk.register(control, { mode = "i" })

-- Line move
local line_move = {
  ["H"] = { "^", "Move to the first non-blank character" },
  ["L"] = { "g_", "Move to the latest non-blank character" },
}
wk.register(line_move, { mode = "n" })
wk.register(line_move, { mode = "v" })

-- Delete char without yank
local del_char_without_yank = {
  ["x"] = { '"_x', "Delete current char without yank" },
  ["X"] = { '"_X', "Delete prev char without yank" },
}
wk.register(del_char_without_yank, { mode = "n" })
wk.register(del_char_without_yank, { mode = "v" })

-- Visual paste without yank
wk.register({
  ["p"] = { '"_dP', "Visual paste without yank" },
}, { mode = "v" })

wk.register({
  ["l"] = { "<cmd>noh<cr>", "noh" },
}, { prefix = "<leader>" })
