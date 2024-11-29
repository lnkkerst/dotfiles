return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        -- background = {
        --   light = "latte",
        --   dark = "mocha",
        -- },
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
        custom_highlights = function()
          return {
            -- LspFloatWinNormal = { link = "Normal" },
          }
        end,
        integrations = {
          alpha = false,
          cmp = true,
          gitsigns = true,
          nvimtree = true,
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
          illuminate = {
            enabled = true,
            lsp = false,
          },
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
          -- fzf = true,
          blink_cmp = true,
          diffview = true,
          nvim_surround = true,
          ufo = true,
        },
      })
      vim.api.nvim_command("colorscheme catppuccin")
    end,
  },
}
