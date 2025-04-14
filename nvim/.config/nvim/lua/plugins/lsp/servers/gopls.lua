local M = {}

function M.init()
  local lspconfig = require("lspconfig")
  local plugin_lsp = require("utils.lsp")

  lspconfig.gopls.setup({
    on_attach = function(client, bufnr)
      plugin_lsp.common_on_attach(client, bufnr)
      require("lsp-format").on_attach(client, bufnr)
    end,
    capabilities = plugin_lsp.common_capabilities,
    settings = {
      gopls = {
        experimentalPostfixCompletions = true,
        analyses = {
          unusedparams = true,
          shadow = true,
        },
        staticcheck = true,

        gofumpt = true,
        completeUnimported = true,
        usePlaceholders = true,

        hints = {
          rangeVariableTypes = true,
          parameterNames = true,
          constantValues = true,
          assignVariableTypes = true,
          compositeLiteralFields = true,
          compositeLiteralTypes = true,
          functionTypeParameters = true,
        },
      },
    },
    init_options = {
      usePlaceholders = true,
    },
  })
end

return M
