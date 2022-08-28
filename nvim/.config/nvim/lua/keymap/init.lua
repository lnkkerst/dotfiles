require("keymap.config")

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
  ["<Tab>"] = { "<cmd>BufferLineCycleNext<cr>", "BufferLineCycleNext" },
  ["<S-Tab>"] = { "<cmd>BufferLineCyclePrev<cr>", "BufferLineCyclePrev" },
  ["<S-q>"] = { "<cmd>bd<cr>", "BufferLinePickClise" },
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
})

-- Plugin Lspsaga
wk.register({
  ["K"] = { "<cmd>Lspsaga hover_doc<cr>", "Lspsaga hover doc" },
  ["g"] = {
    -- name = "lspsaga action",
    ["h"] = { "<cmd>Lspsaga lsp_finder<cr>", "Lspsaga finder" },
    ["j"] = {
      "<cmd>Lspsaga diagnostic_jump_next<cr>",
      "Lspsaga next diagnostics",
    },
    ["k"] = {
      "<cmd>Lspsaga diagnostic_jump_prev<cr>",
      "Lspsaga prev diagnostics",
    },
    ["J"] = {
      '<cmd>lua require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })<cr>',
      "Lspsaga next error diagnostics",
    },
    ["K"] = {
      '<cmd>lua require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })<cr>',
      "Lspsaga prev error diagnostics",
    },
    ["r"] = { "<cmd>Lspsaga rename<cr>", "Lspsaga rename" },
    ["d"] = {
      "<cmd>Lspsaga preview_definition<cr>",
      "Lspsaga preview definition",
    },
    ["<C-S-K>"] = {
      "<cmd>Lspsaga signature_help<cr>",
      "Lspsafa signature_help",
    },
  },
  ["<C-f>"] = {
    "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<cr>",
    "Lspsaga smart sroll forward",
  },
  ["<C-b>"] = {
    "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<cr>",
    "Lspsaga smart sroll backward",
  },
})
wk.register({
  ["<leader>ca"] = {
    "<cmd>Lspsaga code_action<cr>",
    "Lspsaga range code action",
  },
}, { mode = "n" })
wk.register({
  ["<leader>ca"] = {
    "<cmd><C-u>Lspsaga range_code_action<cr>",
    "Lspsaga range code action",
  },
}, { mode = "v" })

-- Plugin Lspconfig
wk.register({
  ["g"] = {
    -- name = "lsp action",
    ["d"] = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Lsp goto definition" },
    ["D"] = {
      "<cmd>lua vim.lsp.buf.declaration()<cr>",
      "Lsp goto declaration",
    },
  },
})

-- Plugin accelerate_jk
wk.register({
  ["j"] = { "<Plug>(accelerated_jk_gj)", "accelerate j" },
  ["k"] = { "<Plug>(accelerated_jk_gk)", "accelerate k" },
})

-- Plugin Nvim-tree
wk.register({
  ["<C-n>"] = { "<cmd>NvimTreeToggle<cr>", "NvimTreeToggle" },
})

-- Plugin Aerial
wk.register({
  ["<A-a>"] = { "<cmd>AerialToggle<cr>", "AerialToggle" },
})

-- Plugin Telescope
wk.register({
  ["f"] = {
    name = "+Telescope",
    ["f"] = { "<cmd>Telescope find_files<cr>", "Telescope find files" },
    ["n"] = { "<cmd>Telescope notify<cr>", "Telescope notify" },
    ["b"] = { "<cmd>Telescope buffers<cr>", "Telescope buffers" },
    ["m"] = { "<cmd>Telescope marks<cr>", "Telescope marks" },
    ["t"] = { "<cmd>Telescope<cr>", "Telescope buildin" },
    ["g"] = { "<cmd>Telescope diagnostics<cr>", "Telescope diagnostics" },
    ["c"] = {
      "<cmd>Telescope current_buffer_fuzzy_finder<cr>",
      "Telescope current_buffer_fuzzy_finder",
    },
  },
}, { prefix = "<leader>" })
wk.register({
  ["<C-p>"] = { "<cmd>Telescope find_files<cr>", "Find files" },
})

-- Plugin Markdown Preview
wk.register({
  ["<F12>"] = {
    "<cmd>MarkdownPreviewToggle<cr>",
    "Markdown Preview",
  },
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

-- Plugin Jaq
wk.register({
  ["j"] = { "<cmd>Jaq<cr>", "Jaq" },
}, { prefix = "<leader>" })

-- Plugin focus.nvim
wk.register({
  ["F"] = {
    name = "focus",
    ["h"] = { "<cmd>FocusSplitLeft<cr>", "FocusSplitLeft" },
    ["j"] = { "<cmd>FocusSplitDown<cr>", "FocusSplitDown" },
    ["k"] = { "<cmd>FocusSplitUp<cr>", "FocusSplitUp" },
    ["l"] = { "<cmd>FocusSplitRight<cr>", "FocusSplitRight" },
  },
}, { prefix = "<leader>" })

-- Plugin ToggleTerm
wk.register({
  ["<C-\\>"] = { "<cmd>ToggleTerm<cr>", "ToggleTerm" },
})
wk.register({
  ["<C-\\>"] = { "<cmd>ToggleTerm<cr>", "ToggleTerm" },
}, { mode = "t" })

-- Plugin NeoScroll
wk.register({
  ["<C-b>"] = { "NeoScroll backward" },
  ["<C-f>"] = { "NeoScroll forward" },
  ["<C-u>"] = { "NeoScroll up" },
  ["<C-d>"] = { "NeoScroll down" },
  ["<C-y>"] = { "NeoScroll up" },
  ["<C-e>"] = { "NeoScroll down" },
})

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

local control = {
  ["<C-s>"] = { "<cmd>w<cr>", "Save file" },
  ["<C-v>"] = { "<cmd>put<cr>", "Paste", mode = "i" },
}
wk.register(control)
wk.register(control, { mode = "i" })

local undo_redo = {
  ["<A-z>"] = { "<cmd>undo<cr>", "Undo" },
  ["<A-S-z>"] = { "<cmd>redo<cr>", "Redo" },
}

wk.register(undo_redo)
wk.register(undo_redo, { mode = "i" })

-- Window movement
local window_focus = {
  ["<C-j>"] = { "<C-w>j", "Go to the down window" },
  ["<C-k>"] = { "<C-w>k", "Go to the up window" },
  ["<C-h>"] = { "<C-w>h", "Go to the left window" },
  ["<C-l>"] = { "<C-w>l", "Go to the right window" },
}

wk.register(window_focus, { mode = "n" })
wk.register(window_focus, { mode = "i" })

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
