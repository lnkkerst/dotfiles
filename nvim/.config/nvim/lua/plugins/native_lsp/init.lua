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
    "nvimdev/lspsaga.nvim",
    -- branch = "main",
    event = "LspAttach",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      local saga = require("lspsaga")
      local wk = require("which-key")

      saga.setup({
        ui = {
          border = "single",
          code_action = "",
          colors = require("catppuccin.groups.integrations.lsp_saga").custom_colors(),
          kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
        },
        code_action = {
          show_server_name = true,
          extend_gitsigns = true,
        },
        rename = {
          in_select = false,
        },
        definition = {
          keys = {
            edit = "o",
          },
        },
      })

      wk.add({
        {
          "gd",
          "<cmd>Lspsaga peek_definition<cr>",
          desc = "Peek definition",
        },
        {
          "gD",
          "<cmd>Lspsaga peek_type_definition<cr>",
          desc = "Peek type definition",
        },
        {
          "gh",
          "<cmd>Lspsaga finder<cr>",
          desc = "Lsp finder",
        },
        {
          "]d",
          "<cmd>Lspsaga diagnostic_jump_next<cr>",
          desc = "Jump to next diagnostic",
        },
        {
          "[d",
          "<cmd>Lspsaga diagnostic_jump_prev<cr>",
          desc = "Jump to prev diagnostic",
        },
        {
          "]D",
          function()
            require("lspsaga.diagnostic"):goto_next({
              severity = vim.diagnostic.severity.ERROR,
            })
          end,
          desc = "Jump to next error diagnostic",
        },
        {
          "[D",
          function()
            require("lspsaga.diagnostic"):goto_prev({
              severity = vim.diagnostic.severity.ERROR,
            })
          end,
          desc = "Jump to prev error diagnostic",
        },
        {
          "K",
          "<cmd>Lspsaga hover_doc<cr>",
          desc = "Hover doc",
        },
        {
          "<leader>ca",
          "<cmd>Lspsaga code_action<cr>",
          desc = "Code Action",
          mode = { "n", "v" },
        },
        {
          "<leader>rn",
          "<cmd>Lspsaga rename<cr>",
          desc = "Rename symbol",
        },
        {
          "<leader>cd",
          "<cmd>Lspsaga show_line_diagnostics<cr>",
          desc = "Show line diagnostics",
        },
        {
          "<A-s>",
          "<cmd>Lspsaga outline<cr>",
          desc = "Lspsaga outline",
        },
      })
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
