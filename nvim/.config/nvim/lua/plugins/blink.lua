return {
  {
    "saghen/blink.cmp",
    lazy = false,
    -- build = "cargo build --release",
    -- version = false,
    version = "v0.*",
    dependencies = { "rafamadriz/friendly-snippets" },
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      enabled = function()
        return vim.bo.buftype ~= "prompt"
      end,

      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
        providers = {
          lazydev = {
            name = "Development",
            module = "lazydev.integrations.blink",
            fallbacks = { "lsp" },
          },
        },
      },

      keymap = {
        preset = "default",
        ["<Cr>"] = { "accept", "fallback" },
        ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
        cmdline = {
          preset = "default",
          ["<Cr>"] = { "fallback" },
          ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
          ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
        },
      },

      completion = {
        list = {
          selection = {
            preselect = false,
            auto_insert = true,
          },
        },

        accept = {
          auto_brackets = {
            enabled = false,
          },
        },

        menu = {
          border = "single",
        },

        documentation = {
          auto_show = true,
          window = {
            border = "single",
          },
        },
      },
    },
  },

  {
    "chrisgrieser/nvim-scissors",
    dependencies = { "nvim-telescope/telescope.nvim", "garymjr/nvim-snippets" },
    cmd = {
      "ScissorsEditSnippet",
      "ScissorsAddNewSnippet",
      "ScissorsCreateSnippetsForSnippetVars",
    },
    opts = {},
  },
}
