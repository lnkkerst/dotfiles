return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "mason.nvim",
      "mason-lspconfig.nvim",
      "lsp-format.nvim",
      "fidget.nvim",
      "vim-illuminate",
    },
    config = function()
      vim.diagnostic.config({
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.INFO] = " ",
            [vim.diagnostic.severity.HINT] = " ",
          },
        },
        update_in_insert = false,
        underline = false,
        severity_sort = true,
        virtual_text = {
          source = false,
        },
      })

      require("plugins.native_lsp.servers").init_all()
    end,
  },
  {
    "williamboman/mason.nvim",
    lazy = true,
    cmd = { "Mason" },
    config = true,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    lazy = true,
    dependencies = { "mason.nvim" },
    config = true,
    opts = {
      automatic_installation = true,
    },
  },

  {
    "lukas-reineke/lsp-format.nvim",
    lazy = true,
    config = true,
  },

  {
    "j-hui/fidget.nvim",
    enabled = true,
    lazy = true,
    tag = "legacy",
    config = function()
      require("fidget").setup({
        sources = { ["null-ls"] = { ignore = true } },
        window = { blend = 0 },
      })
    end,
  },
  { "b0o/schemastore.nvim", event = { "LspAttach" } },
}
