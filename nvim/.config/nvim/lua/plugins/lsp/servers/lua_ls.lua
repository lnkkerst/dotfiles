local lspconfig = require("lspconfig")
local plugin_lsp = require("utils.lsp")

local M = {}

function M.init()
  if true then
    return
  end

  lspconfig.lua_ls.setup({
    on_attach = plugin_lsp.common_on_attach,
    capabilities = plugin_lsp.common_capabilities,
    settings = {
      Lua = {
        hint = { enable = true },
      },
    },
  })
end

return M
