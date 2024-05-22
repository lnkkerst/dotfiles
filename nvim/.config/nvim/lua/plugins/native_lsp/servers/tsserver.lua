local lspconfig = require("lspconfig")
local plugin_lsp = require("utils.native_lsp")

local M = {}

function M.init()
  -- lspconfig.tsserver.setup({
  --   enabled = true,
  --   on_attach = plugin_lsp.common_on_attach,
  --   capabilities = plugin_lsp.common_capabilities,
  --   settings = {
  --     javascript = {
  --       inlayHints = {
  --         includeInlayEnumMemberValueHints = true,
  --         includeInlayFunctionLikeReturnTypeHints = true,
  --         includeInlayFunctionParameterTypeHints = true,
  --         includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
  --         includeInlayParameterNameHintsWhenArgumentMatchesName = true,
  --         includeInlayPropertyDeclarationTypeHints = true,
  --         includeInlayVariableTypeHints = true,
  --       },
  --     },
  --     typescript = {
  --       inlayHints = {
  --         includeInlayEnumMemberValueHints = true,
  --         includeInlayFunctionLikeReturnTypeHints = true,
  --         includeInlayFunctionParameterTypeHints = true,
  --         includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
  --         includeInlayParameterNameHintsWhenArgumentMatchesName = true,
  --         includeInlayPropertyDeclarationTypeHints = true,
  --         includeInlayVariableTypeHints = true,
  --       },
  --     },
  --   },
  -- })

  require("typescript-tools").setup({
    on_attach = function(client, bufnr)
      plugin_lsp.common_on_attach(client, bufnr)

      -- require("workspace-diagnostics").populate_workspace_diagnostics(
      --   client,
      --   bufnr
      -- )
    end,
    capabilities = plugin_lsp.common_capabilities,
    init_options = {
      hostInfo = "neovim",
      plugins = {
        {
          name = "@vue/typescript-plugin",
          location = "/home/lnk/.local/share/pnpm/global/5/node_modules/@vue/typescript-plugin",
          languages = { "javascript", "typescript", "vue" },
        },
      },
    },
    filetypes = {
      "javascript",
      "javascriptreact",
      "javascript.jsx",
      "typescript",
      "typescriptreact",
      "typescript.tsx",
      "vue",
    },
  })
end

return M
