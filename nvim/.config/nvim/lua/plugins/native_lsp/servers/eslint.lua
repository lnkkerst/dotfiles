local lspconfig = require("lspconfig")
local lsp_format = require("lsp-format")
local plugin_lsp = require("plugins.native_lsp")

local M = {}

function M.init()
  lspconfig.eslint.setup({
    on_attach = function(client, bufnr)
      plugin_lsp.common_on_attach(client, bufnr)
      lsp_format.on_attach(client)
    end,
    capabilities = plugin_lsp.common_capabilities,
  })
end

return M
