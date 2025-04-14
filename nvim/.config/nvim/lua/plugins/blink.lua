---@type LazySpec
return {
  {
    "saghen/blink.cmp",
    version = "*",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      "rafamadriz/friendly-snippets",
      {
        "xzbdmw/colorful-menu.nvim",
        opts = {},
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
        default = { "lsp", "path", "snippets", "buffer", "lazydev" },
        providers = {
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

        preset = "super-tab",
        -- ["<Cr>"] = { "accept", "fallback" },
        ["<Tab>"] = {
          function(cmp)
            local copilot = require("copilot.suggestion")
            if copilot.is_visible() and cmp.get_selected_item() == nil then
              copilot.accept()
              return true
            end
            if cmp.snippet_active() then
              return cmp.accept()
            else
              return cmp.select_and_accept()
            end
          end,
          function() end,
          -- "select_next",
          "snippet_forward",
          "fallback",
        },
        ["<CR>"] = { "accept", "fallback" },
        ["<C-y>"] = { "accept", "fallback" },
        -- ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
        ["<C-j>"] = { "select_next", "fallback" },
        ["<C-k>"] = { "select_prev", "fallback" },
        ["<C-u>"] = { "scroll_documentation_up", "fallback" },
        ["<C-d>"] = { "scroll_documentation_down", "fallback" },
      },

      completion = {
        keyword = {
          range = "full",
        },

        trigger = {
          show_in_snippet = false,
        },

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
          -- draw = {
          --   treesitter = { "lsp" },
          --   columns = {
          --     { "label", "label_description", gap = 1 },
          --     { "kind", "source_name", gap = 1 },
          --   },
          -- },
          draw = {
            -- We don't need label_description now because label and label_description are already
            -- combined together in label by colorful-menu.nvim.
            columns = {
              { "label", gap = 1 },
              { "kind", "source_name", gap = 1 },
            },
            components = {
              label = {
                text = function(ctx)
                  return require("colorful-menu").blink_components_text(ctx)
                end,
                highlight = function(ctx)
                  return require("colorful-menu").blink_components_highlight(ctx)
                end,
              },
            },
          },
        },

        documentation = {
          auto_show = true,
          auto_show_delay_ms = 500,
          window = {
            border = "single",
          },
        },

        ghost_text = {
          enabled = false,
        },
      },

      cmdline = {
        enabled = true,
        keymap = {
          ["<C-j>"] = { "select_next" },
          ["<C-k>"] = { "select_prev" },
        },
        completion = {
          menu = {
            auto_show = true,
          },
          list = {
            selection = {
              preselect = false,
              auto_insert = true,
            },
          },
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
