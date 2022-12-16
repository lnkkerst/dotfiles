require("catppuccin").setup({
  flavour = "mocha",
  background = {
    light = "latte",
    dark = "mocha",
  },
  transparent_background = false,
  term_colors = false,
  styles = {
    comments = { "italic" },
    conditionals = { "italic" },
  },
  custom_highlights = function()
    return {
      LspFloatWinNormal = { link = "Normal" },
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
    ts_rainbow = true,
    symbols_outline = {
      enabled = true,
    },
    lsp_trouble = true,
    lsp_saga = true,
    which_key = true,
    fidget = true,
    illuminate = true,
    indent_blankline = {
      enabled = true,
      colored_indent_levels = true,
      dap = {
        enabled = true,
        enable_ui = true, -- enable nvim-dap-ui
      },
    },
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
    navic = {
      enabled = true,
      custom_bg = "NONE",
    },
  },
})
vim.api.nvim_command("colorscheme catppuccin")
