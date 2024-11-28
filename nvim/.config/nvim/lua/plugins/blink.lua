return {

  {
    "saghen/blink.cmp",
    lazy = false,
    -- build = "cargo build --release",
    version = "v0.*",
    dependencies = { "rafamadriz/friendly-snippets" },
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      nerd_font_variant = "mono",

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

      -- accept = { auto_brackets = { enabled = true } }
      trigger = { signature_help = { enabled = true } },

      keymap = {
        preset = "default",
        ["<Cr>"] = { "accept", "fallback" },
        ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
      },
      windows = {
        autocomplete = {
          -- border = "single",
          selection = "auto_insert",
          draw = {
            columns = {
              { "kind_icon" },
              { "label", "label_description", gap = 1 },
              { "provider" },
            },
            components = {
              provider = {
                text = function(ctx)
                  return "[" .. ctx.item.source_name:sub(1, 3):upper() .. "]"
                end,
              },
            },
          },
        },
        documentation = {
          -- border = "single",
          auto_show = true,
          auto_show_delay_ms = 50,
        },
        signature_help = {
          -- border = "single",
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
