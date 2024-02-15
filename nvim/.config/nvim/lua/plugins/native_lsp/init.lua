return {
  {
    "neovim/nvim-lspconfig",
    -- event = "BufReadPre",
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
        update_in_insert = true,
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
    config = true,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    config = true,
  },

  {
    "lukas-reineke/lsp-format.nvim",
    config = true,
  },

  {
    "j-hui/fidget.nvim",
    enabled = true,
    tag = "legacy",
    dependencies = "nvim-lspconfig",
    config = function()
      require("fidget").setup({
        sources = { ["null-ls"] = { ignore = true } },
        window = { blend = 0 },
      })
    end,
  },
  { "b0o/schemastore.nvim" },
}
