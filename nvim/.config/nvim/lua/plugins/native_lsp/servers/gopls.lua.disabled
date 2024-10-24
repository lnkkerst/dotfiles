local lspconfig = require("lspconfig")
local plugin_lsp = require("utils.native_lsp")

local M = {}

function M.init()
  lspconfig.gopls.setup({
    on_attach = plugin_lsp.common_on_attach,
    capabilities = plugin_lsp.common_capabilities,
    settings = {
      gopls = {
        experimentalPostfixCompletions = true,
        analyses = {
          unusedparams = true,
          shadow = true,
        },
        staticcheck = true,
      },
    },
    init_options = {
      usePlaceholders = true,
    },
  })
end

return M
