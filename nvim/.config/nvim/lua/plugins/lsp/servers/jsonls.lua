local lspconfig = require("lspconfig")
local plugin_lsp = require("utils.lsp")

local M = {}

function M.init()
  lspconfig.jsonls.setup({
    on_attach = plugin_lsp.common_on_attach,
    capabilities = plugin_lsp.common_capabilities,
    settings = {
      json = {
        schemas = require("schemastore").json.schemas(),
        validate = { enable = true },
      },
    },
  })
end

return M
