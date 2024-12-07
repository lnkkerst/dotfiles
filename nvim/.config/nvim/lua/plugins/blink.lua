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
      appearance = {
        use_nvim_cmp_as_default = true,
      },

      sources = {
        completion = {
          enabled_providers = {
            "lsp",
            "path",
            "snippets",
            "buffer",
            "lazydev",
          },
        },
        providers = {
          lsp = {
            name = "LSP",
            fallback_for = {
              "lazydev",
            },
          },
          lazydev = {
            name = "Development",
            module = "lazydev.integrations.blink",
          },
        },
      },

      keymap = {
        preset = "default",
        ["<Cr>"] = { "accept", "fallback" },
        ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
      },

      completion = {
        list = {
          selection = "auto_insert",
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
    "hrsh7th/nvim-cmp",
    event = { "CmdlineEnter" },
    dependencies = {
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-cmdline" },
    },
    config = function()
      local cmp = require("cmp")

      cmp.setup({
        enabled = function()
          if vim.bo.buftype == "prompt" then
            return false
          end
          return true
        end,
      })

      cmp.setup.cmdline("/", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "buffer" },
        }),
      })

      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "cmdline" },
          { name = "path" },
        },
      })
    end,
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
