vim.g.mapleader = " "
require("keymap.config")

local wk = require("which-key")

wk.register({
    name = "bufferline",
    ["<A-1>"] = { "<cmd>BufferLineGoToBuffer 1<cr>", "BufferLineGoToBuffer 1" },
    ["<A-2>"] = { "<cmd>BufferLineGoToBuffer 2<cr>", "BufferLineGoToBuffer 2" },
    ["<A-3>"] = { "<cmd>BufferLineGoToBuffer 3<cr>", "BufferLineGoToBuffer 3" },
    ["<A-4>"] = { "<cmd>BufferLineGoToBuffer 4<cr>", "BufferLineGoToBuffer 4" },
    ["<A-5>"] = { "<cmd>BufferLineGoToBuffer 5<cr>", "BufferLineGoToBuffer 5" },
    ["<A-6>"] = { "<cmd>BufferLineGoToBuffer 6<cr>", "BufferLineGoToBuffer 6" },
    ["<A-7>"] = { "<cmd>BufferLineGoToBuffer 7<cr>", "BufferLineGoToBuffer 7" },
    ["<A-8>"] = { "<cmd>BufferLineGoToBuffer 8<cr>", "BufferLineGoToBuffer 8" },
    ["<A-9>"] = { "<cmd>BufferLineGoToBuffer 9<cr>", "BufferLineGoToBuffer 9" },
    ["<A-j>"] = { "<cmd>BufferLineCycleNext<cr>", "BufferLineCycleNext" },
    ["<A-k>"] = { "<cmd>BufferLineCyclePrev<cr>", "BufferLineCyclePrev" },
    ["<A-S-j>"] = { "<cmd>BufferLineMoveNext<cr>", "BufferLineMoveNext" },
    ["<A-S-k>"] = { "<cmd>BufferLineMovePrev<cr>", "BufferLineMovePrev" },
    b = {
        name = "bufferline action",
        ["e"] = { "<cmd>BufferLineSortByExtension<cr>", "BufferLineSortByExtension" },
        ["d"] = { "<cmd>BufferLineSortByDirectory<cr>", "BufferLineSortByDirectory" },
        ["p"] = { "<cmd>BufferLinePick<cr>", "BufferLinePick" }
    }
})

wk.register({
    name = "lspsaga",
    ["K"] = { "<cmd>Lspsaga hover_doc<cr>", "Lspsaga hover doc" },
    g = {
        name = "lspsaga action",
        x = { "<cmd>Lspsaga code_action<cr>", "Lspsaga code action" },
        d = { "<cmd>Lspsaga show_line_diagnostics<cr>", "Lspsaga show line diagnostics" },
        j = { "<cmd>Lspsaga diagnostic_jump_next<cr>", "Lspsaga next diagnostics" },
        k = { "<cmd>Lspsaga diagnostic_jump_prev<cr>", "Lspsaga prev diagnostics" },
        r = { "<cmd>Lspsaga rename<cr>", "Lspsaga rename" }
    }
})

wk.register({
    name = "lspsaga",
    ["gx"] = { "<cmd>Lspsaga range_code_action<cr>", "Lspsaga range code action", mode = "x" }
})

wk.register({
    name = "accelerate_jk",
    ["j"] = { "<Plug>(accelerated_jk_gj)", "accelerate j" },
    ["k"] = { "<Plug>(accelerated_jk_gk)", "accelerate k" }
})

wk.register({
    name = "nvim-tree",
    ["<C-n>"] = { "<cmd>NvimTreeToggle<cr>", "NvimTreeToggle" }
})

wk.register({
    name = "aerial",
    ["<A-a>"] = { "<cmd>AerialToggle<cr>", "AerialToggle" }
})

wk.register({
    ["t"] = {
        name = "Telescope",
        ["f"] = {
            "<cmd>Telescope find_files<cr>",
            "Telescope find files"
        }
    }
}, { prefix = "<leader>" })

wk.register({
    name = "markdown preview",
    ["<F12>"] = {
        "<cmd>MarkdownPreviewToggle<cr>",
        "Markdown Preview"
    }
})

wk.register({
    name = "hop",
    ["h"] = {
        name = "Hop action",
        ["l"] = { "<cmd>HopLine<cr>", "HopLine" },
        ["w"] = { "<cmd>HopWord<cr>", "HopWord" },
        ["c"] = {
            name = "HopChar",
            ["1"] = { "<cmd>HopChar1<cr>", "HopChar1" },
            ["2"] = { "<cmd>HopChar2<cr>", "HopChar2" }
        },
        ["p"] = { "<cmd>HopPattern<cr>", "HopPattern" }
    }
}, { prefix = "<leader>" })

wk.register({
    name = "jaq",
    ["j"] = { "<cmd>Jaq<cr>", "Jaq" }
}, { prefix = "<leader>" })
