return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    version = false,
    priority = 1000,
    opts = function()
      return {
        flavour = "mocha",
        -- transparent_background = not vim.g.neovide,
        show_end_of_buffer = false,
        term_colors = false,
        styles = {
          comments = { "italic" },
          conditionals = { "italic" },
          loops = {},
          functions = {},
          keywords = {},
          strings = {},
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = {},
          operators = {},
        },
        custom_highlights = function(colors)
          return {
            NormalFloat = { link = "Normal" },

            BlinkCmpMenu = { link = "NormalFloat" },
            BlinkCmpMenuBorder = { link = "FloatBorder" },
            BlinkCmpDoc = { link = "NormalFloat" },
            BlinkCmpDocBorder = { link = "FloatBorder" },

            SnacksIndentScope = { fg = colors.mauve },

            SniprunVirtualTextOk = { link = "@text.note" },
            SniprunVirtualTextError = { link = "@error" },
          }
        end,
        integrations = {
          alpha = false,
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          neotree = true,
          telescope = true,
          treesitter = true,
          treesitter_context = true,
          aerial = true,
          dashboard = true,
          harpoon = true,
          mason = true,
          neogit = true,
          neotest = true,
          -- noice = true,
          notify = true,
          rainbow_delimiters = true,
          lsp_trouble = true,
          lsp_saga = true,
          -- leap = true,
          which_key = true,
          fidget = true,
          -- indent_blankline = {
          --   enabled = true,
          --   scope_color = "lavender",
          --   colored_indent_levels = true,
          -- },
          dap = true,
          dap_ui = true,
          native_lsp = {
            enabled = true,
            virtual_text = {
              errors = { "italic" },
              hints = { "italic" },
              warnings = { "italic" },
              information = { "italic" },
            },
            underlines = {
              errors = { "underline" },
              hints = { "underline" },
              warnings = { "underline" },
              diff = true,
              information = { "underline" },
            },
            inlay_hints = {
              background = true,
            },
          },
          overseer = true,
          colorful_winsep = {
            enabled = true,
            color = "blue",
          },
          grug_far = true,
          fzf = true,
          blink_cmp = true,
          diffview = true,
          nvim_surround = true,
          ufo = true,
          snacks = true,
          copilot_vim = true,
          mini = {
            enabled = true,
          },
        },
      }
    end,
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.api.nvim_command("colorscheme catppuccin")
    end,
  },
}
