return {
  {
    "akinsho/bufferline.nvim",
    -- event = "VimEnter",
    dependencies = { "kyazdani42/nvim-web-devicons", "catppuccin/nvim" },
    config = function()
      require("bufferline").setup({
        options = {
          mod = "buffers",
          numbers = "ordinal",
          diagnostics = "nvim_lsp",
          offsets = {
            {
              filetype = "NvimTree",
              text = "File Explorer",
              text_align = "center",
              padding = 1,
            },
          },
        },
        highlights = require("catppuccin.groups.integrations.bufferline").get(),
      })

      local wk = require("which-key")

      wk.register({
        ["{ A-1 }"] = {
          "<cmd>BufferLineGoToBuffer 1<cr>",
          "BufferLineGoToBuffer 1",
        },
        ["<A-2>"] = {
          "<cmd>BufferLineGoToBuffer 2<cr>",
          "BufferLineGoToBuffer 2",
        },
        ["<A-3>"] = {
          "<cmd>BufferLineGoToBuffer 3<cr>",
          "BufferLineGoToBuffer 3",
        },
        ["<A-4>"] = {
          "<cmd>BufferLineGoToBuffer 4<cr>",
          "BufferLineGoToBuffer 4",
        },
        ["<A-5>"] = {
          "<cmd>BufferLineGoToBuffer 5<cr>",
          "BufferLineGoToBuffer 5",
        },
        ["<A-6>"] = {
          "<cmd>BufferLineGoToBuffer 6<cr>",
          "BufferLineGoToBuffer 6",
        },
        ["<A-7>"] = {
          "<cmd>BufferLineGoToBuffer 7<cr>",
          "BufferLineGoToBuffer 7",
        },
        ["<A-8>"] = {
          "<cmd>BufferLineGoToBuffer 8<cr>",
          "BufferLineGoToBuffer 8",
        },
        ["<A-9>"] = {
          "<cmd>BufferLineGoToBuffer 9<cr>",
          "BufferLineGoToBuffer 9",
        },
        -- ["<A-S-j>"] = { "<cmd>BufferLineCycleNext<cr>", "BufferLineCycleNext" },
        -- ["<A-S-k>"] = { "<cmd>BufferLineCyclePrev<cr>", "BufferLineCyclePrev" },
        ["<A-S-j>"] = { "<cmd>BufferLineMoveNext<cr>", "BufferLineMoveNext" },
        ["<A-S-k>"] = { "<cmd>BufferLineMovePrev<cr>", "BufferLineMovePrev" },
        ["<A-n>"] = { "<cmd>BufferLineCycleNext<cr>", "BufferLineCycleNext" },
        ["<A-p>"] = { "<cmd>BufferLineCyclePrev<cr>", "BufferLineCyclePrev" },
        ["<A-Tab>"] = { "<cmd>BufferLineCycleNext<cr>", "BufferLineCycleNext" },
        ["<A-S-Tab>"] = {
          "<cmd>BufferLineCyclePrev<cr>",
          "BufferLineCyclePrev",
        },
        ["<S-q>"] = { "<cmd>Bdelete<cr>", "Bufdelete" },
        ["<C-q>"] = { "<cmd>:q<cr>", "Close window" },
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
    end,
  },
}
