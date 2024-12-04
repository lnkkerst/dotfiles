return {
  {
    "rainbowhxch/accelerated-jk.nvim",
    event = "VeryLazy",
    vscode = true,
    keys = {
      {
        "j",
        "<Plug>(accelerated_jk_gj)",
        desc = "accelerate j",
        mode = { "n" },
      },
      {
        "k",
        "<Plug>(accelerated_jk_gk)",
        desc = "accelerate k",
        mode = { "n" },
      },
    },
  },

  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      check_ts = true,
      ts_config = {
        lua = { "string" },
        javascript = { "template_string" },
      },
    },
    config = function(_, opts)
      require("nvim-autopairs").setup(opts)

      local ok, cmp = pcall(require, "cmp")
      if ok then
        local cmp_autopairs = require("nvim-autopairs.completion.cmp")
        cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
      end
    end,
  },

  {
    "RRethy/vim-illuminate",
    lazy = true,
    config = function()
      require("illuminate").configure({
        providers = {
          "lsp",
          "treesitter",
          "regex",
        },
        delay = 300,
        filetypes_denylist = {
          "dashboard",
          "NvimTree",
        },
      })
    end,
  },

  {
    "gbprod/yanky.nvim",
    opts = {},
    keys = {
      { "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" } },
      { "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" } },
      { "gp", "<Plug>(YankyGPutAfter)", mode = { "n", "x" } },
      { "gP", "<Plug>(YankyGPutBefore)", mode = { "n", "x" } },
      { "y", "<Plug>(YankyYank)", mode = { "n", "x" } },
      { "<M-S-n>", "<Plug>(YankyCycleForward)", mode = { "n" } },
      { "<M-S-p>", "<Plug>(YankyCycleBackward)", mode = { "n" } },
    },
  },

  {
    "tzachar/highlight-undo.nvim",
    opts = {},
  },

  {
    "nacro90/numb.nvim",
    event = { "CmdlineEnter" },
    vscode = true,
    opts = {},
  },

  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    vscode = true,
    opts = {},
  },
}
