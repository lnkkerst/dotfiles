local lspconfig = require("lspconfig")
local util = require("lspconfig.util")
local plugin_lsp = require("plugins.native_lsp")

local M = {}

function M.init()
  lspconfig.pyright.setup({
    on_attach = plugin_lsp.common_on_attach,
    capabilities = plugin_lsp.common_capabilities,
    cmd = { "delance-langserver", "--stdio" },
  })
end

return M
