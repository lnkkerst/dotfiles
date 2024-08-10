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
}
