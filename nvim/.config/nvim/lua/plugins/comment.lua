return {
  {
    "numToStr/Comment.nvim",
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

        pre_hook = require(
          "ts_context_commentstring.integrations.comment_nvim"
        ).create_pre_hook(),
      }
    end,
  },

  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    lazy = true,
    opts = {},
  },
}
