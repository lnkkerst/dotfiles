local lspconfig = require("lspconfig")
local util = require("lspconfig.util")
local plugin_lsp = require("utils.native_lsp")

local M = {}

function M.init()
  lspconfig.denols.setup({
    on_attach = plugin_lsp.common_on_attach,
    capabilities = plugin_lsp.common_capabilities,
    root_dir = util.root_pattern("deno.json", "deno.jsonc"),
  })
end

return M
