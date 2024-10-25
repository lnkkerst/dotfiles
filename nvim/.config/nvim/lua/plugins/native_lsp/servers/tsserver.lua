local lspconfig = require("lspconfig")
local plugin_lsp = require("utils.native_lsp")

local M = {}

function M.init()
  local inlayHints = {
    includeInlayParameterNameHints = "all",
    includeInlayParameterNameHintsWhenArgumentMatchesName = false,
    includeInlayFunctionParameterTypeHints = true,
    includeInlayVariableTypeHints = true,
    includeInlayVariableTypeHintsWhenTypeMatchesName = false,
    includeInlayPropertyDeclarationTypeHints = true,
    includeInlayFunctionLikeReturnTypeHints = true,
    includeInlayEnumMemberValueHints = true,
  }

  -- lspconfig.tsserver.setup({
  --   enabled = true,
  --   on_attach = plugin_lsp.common_on_attach,
  --   capabilities = plugin_lsp.common_capabilities,
  --   settings = {
  --     javascript = {
  --       inlayHints = inlayHints,
  --     },
  --     typescript = {
  --       inlayHints = inlayHints,
  --     },
  --   },
  -- })

  require("typescript-tools").setup({
    on_attach = function(client, bufnr)
      plugin_lsp.common_on_attach(client, bufnr)
      -- client.server_capabilities.semanticTokensProvider = false

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
          location = "/usr/lib/node_modules/@vue/typescript-plugin",
          languages = {
            "javascript",
            "typescript",
            "vue",
            "javascriptreact",
            "typescriptreact",
          },
        },
      },
    },
    settings = {
      tsserver_path = "/usr/lib/node_modules/typescript/lib/tsserver.js",
      tsserver_plugins = { "@vue/typescript-plugin" },
      tsserver_file_preferences = inlayHints,
    },
    root_dir = lspconfig.util.root_pattern(
      "pnpm-workspace.yaml",
      "tsconfig.json",
      "jsconfig.json",
      "package.json",
      ".git"
    ),
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
