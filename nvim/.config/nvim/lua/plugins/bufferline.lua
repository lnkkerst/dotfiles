return {
  {
    "akinsho/bufferline.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons", "catppuccin/nvim" },
    event = "VeryLazy",
    keys = {
      {
        "<A-S-j>",
        "<cmd>BufferLineMoveNext<cr>",
        desc = "Move buffer next",
      },
      {
        "<A-S-k>",
        "<cmd>BufferLineMovePrev<cr>",
        desc = "Move buffer prev",
      },
      {
        "<A-n>",
        "<cmd>BufferLineCycleNext<cr>",
        desc = "Next buffer",
      },
      {
        "<A-p>",
        "<cmd>BufferLineCyclePrev<cr>",
        desc = "Prev buffer",
      },

      { "<leader>bp", "<cmd>BufferLinePick<cr>", desc = "BufferLinePick" },
    },
    opts = function()
      return {
        options = {
          close_command = function(n)
            require("snacks").bufdelete(n)
          end,
          right_mouse_command = function(n)
            require("snacks").bufdelete(n)
          end,
          mod = "buffers",
          numbers = "ordinal",
          diagnostics = "nvim_lsp",
          always_show_bufferline = false,
          offsets = {
            {
              filetype = vim.g.file_explorer == "nvim-tree" and "NvimTree"
                or "neo-tree",
              text = "File Explorer",
              text_align = "center",
              padding = 1,
            },
          },
        },
        highlights = require("catppuccin.groups.integrations.bufferline").get(),
      }
    end,
  },
}
