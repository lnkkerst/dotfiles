local lspconfig = require("lspconfig")
local plugin_lsp = require("plugins.native_lsp")

local M = {}

function M.init()
  lspconfig.yamlls.setup({
    on_attach = plugin_lsp.common_on_attach,
    capabilities = plugin_lsp.common_capabilities,
    settings = {
      yaml = {
        schemaStore = {
          enable = false,
          url = "",
        },
        schemas = require("schemastore").yaml.schemas(),
      },
    },
  })
end

return M
