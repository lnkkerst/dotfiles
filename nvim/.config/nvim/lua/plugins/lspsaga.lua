---@diagnostic disable: param-type-mismatch, redundant-parameter, missing-parameter

return {
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
          theme = "round",
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

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local bufnr = args.buf
          wk.register({
            ["g"] = {
              ["d"] = { "<cmd>Lspsaga peek_definition<cr>", "Peek definition" },
              ["D"] = {
                "<cmd>Lspsaga peek_type_definition<cr>",
                "Peek type definition",
              },
              ["h"] = { "<cmd>Lspsaga finder<cr>", "Lsp finder" },
            },
            ["]d"] = {
              "<cmd>Lspsaga diagnostic_jump_next<cr>",
              "Jump to next diagnostic",
            },
            ["[d"] = {
              "<cmd>Lspsaga diagnostic_jump_prev<cr>",
              "Jump to prev diagnostic",
            },
            ["]D"] = {
              function()
                require("lspsaga.diagnostic"):goto_next({
                  severity = vim.diagnostic.severity.ERROR,
                })
              end,
              "Jump to next error diagnostic",
            },
            ["[D"] = {
              function()
                require("lspsaga.diagnostic"):goto_prev({
                  severity = vim.diagnostic.severity.ERROR,
                })
              end,
              "Jump to prev error diagnostic",
            },
            ["K"] = { "<cmd>Lspsaga hover_doc<cr>", "Hover doc" },
            ["<leader>"] = {
              ["ca"] = { "<cmd>Lspsaga code_action<cr>", "Code Action" },
              ["rn"] = { "<cmd>Lspsaga rename<cr>", "Rename symbol" },
              ["cd"] = {
                "<cmd>Lspsaga show_line_diagnostics<CR>",
                "Show line diagnostics",
              },
            },
          }, { buffer = bufnr })

          wk.register({
            ["<leader>ca"] = { "<cmd>Lspsaga code_action<cr>", "Code Action" },
          }, { buffer = bufnr, mode = "x" })
        end,
      })

      wk.register({
        ["<A-s>"] = { "<cmd>Lspsaga outline<cr>", "Lspsaga outline" },
      })
    end,
  },
}
