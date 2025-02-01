---@type LazySpec
return {
  {
    "saghen/blink.cmp",
    version = "*",
    dependencies = {
      "rafamadriz/friendly-snippets",
      {
        "saghen/blink.compat",
        optional = true,
        opts = {},
      },
      {
        "giuxtaposition/blink-cmp-copilot",
      },
    },
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      enabled = function()
        return vim.bo.buftype ~= "prompt"
      end,

      appearance = {
        nerd_font_variant = "normal",
      },

      sources = {
        default = { "lsp", "path", "snippets", "buffer", "lazydev", "copilot" },
        providers = {
          copilot = {
            name = "copilot",
            module = "blink-cmp-copilot",
            score_offset = 100,
            async = true,
          },
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            score_offset = 100,
          },
        },
      },

      keymap = {
        -- ["<C-space>"] = {
        --   "show",
        --   "show_documentation",
        --   "hide_documentation",
        --   "fallback",
        -- },
        --
        -- ["<C-e>"] = { "hide", "fallback" },
        -- ["<C-y>"] = { "select_and_accept", "fallback" },
        --
        -- ["<C-j>"] = { "select_next", "fallback" },
        -- ["<C-k>"] = { "select_prev", "fallback" },
        --
        -- ["<C-u>"] = { "scroll_documentation_up", "fallback" },
        -- ["<C-d>"] = { "scroll_documentation_down", "fallback" },
        --
        -- ["<Tab>"] = {
        --   function(cmp)
        --     if cmp.snippet_active() then
        --       return cmp.accept()
        --     else
        --       return cmp.select_and_accept()
        --     end
        --   end,
        --   "snippet_forward",
        --   "fallback",
        -- },
        -- ["<S-Tab>"] = { "snippet_backward", "fallback" },

        preset = "default",
        ["<Cr>"] = { "accept", "fallback" },
        ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
        ["<C-j>"] = { "select_next", "fallback" },
        ["<C-k>"] = { "select_prev", "fallback" },
        ["<C-u>"] = { "scroll_documentation_up", "fallback" },
        ["<C-d>"] = { "scroll_documentation_down", "fallback" },
        cmdline = {
          preset = "default",
          ["<Cr>"] = { "fallback" },
          ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
          ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
          ["<C-j>"] = { "select_next", "fallback" },
          ["<C-k>"] = { "select_prev", "fallback" },
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
          auto_show = true,
          border = "single",
          draw = {
            treesitter = { "lsp", "copilot" },
            columns = {
              { "label", "label_description", gap = 1 },
              { "kind", "source_name", gap = 1 },
            },
          },
        },

        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
          window = {
            border = "single",
          },
        },

        ghost_text = {
          enabled = false,
        },
      },
    },
  },

  {
    "chrisgrieser/nvim-scissors",
    cmd = {
      "ScissorsEditSnippet",
      "ScissorsAddNewSnippet",
      "ScissorsCreateSnippetsForSnippetVars",
    },
    opts = {},
  },
}
