require("keymap.config")
require("plugins.utils").legendary()

local wk = require("which-key")

-- Plugin BufferLine
wk.register({
  ["<A-1>"] = { "<cmd>BufferLineGoToBuffer 1<cr>", "BufferLineGoToBuffer 1" },
  ["<A-2>"] = { "<cmd>BufferLineGoToBuffer 2<cr>", "BufferLineGoToBuffer 2" },
  ["<A-3>"] = { "<cmd>BufferLineGoToBuffer 3<cr>", "BufferLineGoToBuffer 3" },
  ["<A-4>"] = { "<cmd>BufferLineGoToBuffer 4<cr>", "BufferLineGoToBuffer 4" },
  ["<A-5>"] = { "<cmd>BufferLineGoToBuffer 5<cr>", "BufferLineGoToBuffer 5" },
  ["<A-6>"] = { "<cmd>BufferLineGoToBuffer 6<cr>", "BufferLineGoToBuffer 6" },
  ["<A-7>"] = { "<cmd>BufferLineGoToBuffer 7<cr>", "BufferLineGoToBuffer 7" },
  ["<A-8>"] = { "<cmd>BufferLineGoToBuffer 8<cr>", "BufferLineGoToBuffer 8" },
  ["<A-9>"] = { "<cmd>BufferLineGoToBuffer 9<cr>", "BufferLineGoToBuffer 9" },
  ["<leader>1"] = {
    "<cmd>BufferLineGoToBuffer 1<cr>",
    "BufferLineGoToBuffer 1",
  },
  ["<leader>2"] = {
    "<cmd>BufferLineGoToBuffer 2<cr>",
    "BufferLineGoToBuffer 2",
  },
  ["<leader>3"] = {
    "<cmd>BufferLineGoToBuffer 3<cr>",
    "BufferLineGoToBuffer 3",
  },
  ["<leader>4"] = {
    "<cmd>BufferLineGoToBuffer 4<cr>",
    "BufferLineGoToBuffer 4",
  },
  ["<leader>5"] = {
    "<cmd>BufferLineGoToBuffer 5<cr>",
    "BufferLineGoToBuffer 5",
  },
  ["<leader>6"] = {
    "<cmd>BufferLineGoToBuffer 6<cr>",
    "BufferLineGoToBuffer 6",
  },
  ["<leader>7"] = {
    "<cmd>BufferLineGoToBuffer 7<cr>",
    "BufferLineGoToBuffer 7",
  },
  ["<leader>8"] = {
    "<cmd>BufferLineGoToBuffer 8<cr>",
    "BufferLineGoToBuffer 8",
  },
  ["<leader>9"] = {
    "<cmd>BufferLineGoToBuffer 9<cr>",
    "BufferLineGoToBuffer 9",
  },
  ["<A-j>"] = { "<cmd>BufferLineCycleNext<cr>", "BufferLineCycleNext" },
  ["<A-k>"] = { "<cmd>BufferLineCyclePrev<cr>", "BufferLineCyclePrev" },
  ["<A-S-j>"] = { "<cmd>BufferLineMoveNext<cr>", "BufferLineMoveNext" },
  ["<A-S-k>"] = { "<cmd>BufferLineMovePrev<cr>", "BufferLineMovePrev" },
  -- ["<Tab>"] = { "<cmd>BufferLineCycleNext<cr>", "BufferLineCycleNext" },
  -- ["<S-Tab>"] = { "<cmd>BufferLineCyclePrev<cr>", "BufferLineCyclePrev" },
  ["<S-q>"] = { "<cmd>bd<cr>", "BufferLinePickClise" },
})
wk.register({
  ["b"] = {
    name = "bufferline action",
    ["e"] = {
      "<cmd>BufferLineSortByExtension<cr>",
      "BufferLineSortByExtension",
    },
    ["d"] = {
      "<cmd>BufferLineSortByDirectory<cr>",
      "BufferLineSortByDirectory",
    },
    ["p"] = { "<cmd>BufferLinePick<cr>", "BufferLinePick" },
  },
}, { prefix = "<leader>" })

-- Plugin accelerate_jk
local accelerate_jk = {
  ["j"] = { "<Plug>(accelerated_jk_gj)", "accelerate j" },
  ["k"] = { "<Plug>(accelerated_jk_gk)", "accelerate k" },
}
wk.register(accelerate_jk)

-- Plugin Nvim-tree
wk.register({
  ["<C-n>"] = { "<cmd>NvimTreeToggle<cr>", "NvimTreeToggle" },
})

-- Plugin HighStr
for i = 1, 8 do
  wk.register({
    ["h" .. i] = {
      ":<C-u>HSHighlight " .. i .. "<cr>",
      "Hightlight current selection",
    },
  }, { mode = "v", prefix = "<leader>" })
end
wk.register({
  ["h"] = {
    ["r"] = {
      ":<C-u>HSRmHighlight<cr>",
      "Remove current selection Highlight",
    },
    ["c"] = { ":<C-u>HSRmHighlight rm_all<cr>", "Clear all Highlight" },
  },
}, { mode = "v", prefix = "<leader>" })

-- Plugin Telescope
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

-- Plugin Legendary
local legendary = {
  ["<C-A-p>"] = { "<cmd>Legendary<cr>", "Legendary" },
}
wk.register(legendary, { mode = "n" })
wk.register(legendary, { mode = "x" })
wk.register(legendary, { mode = "t" })
wk.register(legendary, { mode = "i" })

-- Plugin Markdown Preview
wk.register({
  ["<F12>"] = {
    "<cmd>MarkdownPreviewToggle<cr>",
    "Markdown Preview",
  },
})

-- Plugin yanky
wk.register({
  ["<C-j>"] = { "<Plug>(YankyCycleForward)", "yank for" },
  ["<C-k>"] = { "<Plug>(YankyCycleBackward)", "yank_back" },
})

-- Plugin Hop
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

-- Plugin Jaq
wk.register({
  ["j"] = { "<cmd>Jaq<cr>", "Jaq" },
}, { prefix = "<leader>" })

wk.register({
  ["<C-\\>"] = { "<cmd>ToggleTerm<cr>", "ToggleTerm" },
})
wk.register({
  ["<C-\\>"] = { "<cmd>ToggleTerm<cr>", "ToggleTerm" },
}, { mode = "t" })

-- Plugin Dap
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

-- Plugin Trouble
wk.register({
  ["<A-t>"] = { "<cmd>TroubleToggle<cr>", "TroubleToggle" },
})

-- Plugin Symbols-outline
wk.register({
  ["<A-s>"] = { "<cmd>SymbolsOutline<cr>", "Symbols outline" },
})

-- Plugin hlslens
wk.register({
  ["n"] = {
    "<cmd>execute('normal! ' . v:count1 . 'n')<cr><cmd>lua require('hlslens').start()<cr>",
    "hlslens search forward",
  },
  ["N"] = {
    "<cmd>execute('normal! ' . v:count1 . 'N')<cr><cmd>lua require('hlslens').start()<cr>",
    "hlslens search backward",
  },
  ["*"] = { "*<cmd>lua require('hlslens').start()<cr>", "hlslens start" },
  ["#"] = { "#<cmd>lua require('hlslens').start()<cr>", "hlslens start" },
  ["g*"] = { "g*<cmd>lua require('hlslens').start()<cr>", "hlslens start" },
  ["g#"] = { "g#<cmd>lua require('hlslens').start()<cr>", "hlslens start" },
  ["<leader>l"] = { "<cmd>noh<cr>", "Exit hlslens" },
})

-- Plugin neoclip {
wk.register({
  ['g"'] = { "<cmd>Telescope neoclip<cr>", "Neoclip" },
})

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
  ["<C-S-i>"] = { "<cmd>Neoformat<cr>", "Neoformat" },
}, { mode = "n" })

wk.register({
  ["<C-S-i>"] = { "<cmd>Neoformat<cr>", "Neoformat" },
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

-- Plugin Venn
wk.register({
  ["<leader>v"] = { "<cmd>lua Toggle_venn()<cr>", "Toggle venn" },
})

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
