local lspconfig = require("lspconfig")
local util = require("lspconfig.util")
local plugin_lsp = require("utils.native_lsp")

local M = {}

function M.init()
  require("neodev").setup({})

  lspconfig.lua_ls.setup({
    on_attach = plugin_lsp.common_on_attach,
    capabilities = plugin_lsp.common_capabilities,
  })
end

return M
