return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    dependencies = {
      "mason.nvim",
      "mason-lspconfig.nvim",
      { "onsails/lspkind.nvim", opts = {} },
    },
    config = function()
      -- Override default K map
      vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<cr>")

      local signs = {
        Error = " ",
        Warn = " ",
        Info = " ",
        Hint = " ",
      }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end

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
        -- virtual_text =  {
        --   source = false,
        -- },
        virtual_text = false,
      })

      require("plugins.native_lsp.servers").init_all()
    end,
  },
  {
    "williamboman/mason.nvim",
    lazy = true,
    cmd = { "Mason" },
    opts = {},
  },

  {
    "williamboman/mason-lspconfig.nvim",
    lazy = true,
    dependencies = { "mason.nvim" },
    opts = {
      automatic_installation = false,
    },
  },

  {
    "lukas-reineke/lsp-format.nvim",
    lazy = true,
    opts = {},
  },

  {
    "j-hui/fidget.nvim",
    enabled = true,
    event = { "LspAttach" },
    opts = {},
  },

  { "b0o/schemastore.nvim", event = { "LspAttach" } },

  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "LspAttach",
    opts = {
      signs = {
        left = "",
        right = "",
        diag = "●",
        arrow = "    ",
        up_arrow = "    ",
        vertical = " │",
        vertical_end = " └",
      },
      options = {
        show_source = true,
        multiple_diag_under_cursor = true,
        virt_texts = {
          priority = 4096,
        },
      },
    },
  },

  {
    "chrisgrieser/nvim-lsp-endhints",
    event = "LspAttach",
    opts = {
      label = {
        padding = 1,
        marginLeft = 1,
      },
    },
  },
}
