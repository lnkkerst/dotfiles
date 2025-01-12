return {
  {
    "numToStr/Comment.nvim",
    enabled = false,
    keys = { "gcc", "gbc", { "gc", "gb", mode = { "x" } } },
    opts = function()
      return {
        padding = true,

        -- Ignore empty lines
        ignore = "^$",

        mappings = {
          ---operator-pending mapping
          ---Includes `gcc`, `gcb`, `gc[count]{motion}` and `gb[count]{motion}`
          basic = true,
          ---extra mapping
          ---Includes `gco`, `gcO`, `gcA`
          extra = true,
          ---extended mapping
          ---Includes `g>`, `g<`, `g>[count]{motion}` and `g<[count]{motion}`
          extended = false,
        },

        toggler = {
          ---line-comment keymap
          line = "gcc",
          ---block-comment keymap
          block = "gbc",
        },

        opleader = {
          ---line-comment keymap
          line = "gc",
          ---block-comment keymap
          block = "gb",
        },

        -- pre_hook = require(
        --   "ts_context_commentstring.integrations.comment_nvim"
        -- ).create_pre_hook(),
      }
    end,
  },

  {
    "echasnovski/mini.comment",
    enabled = false,
    opts = {
      options = {
        custom_commentstring = function()
          return require("ts_context_commentstring").calculate_commentstring()
            or vim.bo.commentstring
        end,
      },
    },
  },

  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    lazy = true,
    opts = {
      enable_autocmd = false,
    },
    init = function()
      local get_option = vim.filetype.get_option
      vim.filetype.get_option = function(filetype, option)
        return option == "commentstring"
            and require("ts_context_commentstring.internal").calculate_commentstring()
          or get_option(filetype, option)
      end
    end,
  },
}
