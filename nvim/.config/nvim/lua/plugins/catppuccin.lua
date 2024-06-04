return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        background = {
          light = "latte",
          dark = "mocha",
        },
        transparent_background = not vim.g.neovide,
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
            LspFloatWinNormal = { link = "Normal" },
            LspInlayHint = {
              fg = colors.overlay2,
              bg = colors.surface0,
              style = { "italic" },
            },
          }
        end,
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          telescope = true,
          treesitter = true,
          aerial = true,
          dashboard = true,
          harpoon = true,
          hop = true,
          mason = true,
          neogit = true,
          neotest = true,
          noice = true,
          notify = true,
          treesitter_context = true,
          rainbow_delimiters = true,
          lsp_trouble = true,
          lsp_saga = true,
          leap = true,
          which_key = true,
          fidget = true,
          illuminate = true,
          indent_blankline = {
            enabled = true,
            scope_color = "lavender",
            colored_indent_levels = true,
          },
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
              information = { "underline" },
            },
          },
          overseer = true,
        },
      })
      vim.api.nvim_command("colorscheme catppuccin")
    end,
  },
}
