return {
  {
    "akinsho/bufferline.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons", "catppuccin/nvim" },
    after = "catppuccin",
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

      wk.add({
        {
          "<A-1>",
          "<cmd>BufferLineGoToBuffer 1<cr>",
          desc = "BufferLineGoToBuffer 1",
        },
        {
          "<A-2>",
          "<cmd>BufferLineGoToBuffer 2<cr>",
          desc = "BufferLineGoToBuffer 2",
        },
        {
          "<A-3>",
          "<cmd>BufferLineGoToBuffer 3<cr>",
          desc = "BufferLineGoToBuffer 3",
        },
        {
          "<A-4>",
          "<cmd>BufferLineGoToBuffer 4<cr>",
          desc = "BufferLineGoToBuffer 4",
        },
        {
          "<A-5>",
          "<cmd>BufferLineGoToBuffer 5<cr>",
          desc = "BufferLineGoToBuffer 5",
        },
        {
          "<A-6>",
          "<cmd>BufferLineGoToBuffer 6<cr>",
          desc = "BufferLineGoToBuffer 6",
        },
        {
          "<A-7>",
          "<cmd>BufferLineGoToBuffer 7<cr>",
          desc = "BufferLineGoToBuffer 7",
        },
        {
          "<A-8>",
          "<cmd>BufferLineGoToBuffer 8<cr>",
          desc = "BufferLineGoToBuffer 8",
        },
        {
          "<A-9>",
          "<cmd>BufferLineGoToBuffer 9<cr>",
          desc = "BufferLineGoToBuffer 9",
        },
        {
          "<A-S-j>",
          "<cmd>BufferLineMoveNext<cr>",
          desc = "BufferLineMoveNext",
        },
        {
          "<A-S-k>",
          "<cmd>BufferLineMovePrev<cr>",
          desc = "BufferLineMovePrev",
        },
        {
          "<A-n>",
          "<cmd>BufferLineCycleNext<cr>",
          desc = "BufferLineCycleNext",
        },
        {
          "<A-p>",
          "<cmd>BufferLineCyclePrev<cr>",
          desc = "BufferLineCyclePrev",
        },
        {
          "<A-Tab>",
          "<cmd>BufferLineCycleNext<cr>",
          desc = "BufferLineCycleNext",
        },
        {
          "<A-S-Tab>",
          "<cmd>BufferLineCyclePrev<cr>",
          desc = "BufferLineCyclePrev",
        },
        { "<C-q>", "<cmd>:q<cr>", desc = "Close window" },
      })

      wk.add({
        {
          "<leader>b",
          desc = "bufferline action",
          group = "Bufferline actions",
        },
        {
          "<leader>be",
          "<cmd>BufferLineSortByExtension<cr>",
          desc = "BufferLineSortByExtension",
        },
        {
          "<leader>bd",
          "<cmd>BufferLineSortByDirectory<cr>",
          desc = "BufferLineSortByDirectory",
        },
        { "<leader>bp", "<cmd>BufferLinePick<cr>", desc = "BufferLinePick" },
      })
    end,
  },
}
