local plugin_lsp = require("plugins.native_lsp")
local lsp_format = require("lsp-format")

local M = {}

function M.init()
  require("clangd_extensions").setup({
    server = {
      on_attach = function(client, bufnr)
        plugin_lsp.common_on_attach(client, bufnr)
        lsp_format.on_attach(client)
      end,
      capabilities = plugin_lsp.common_capabilities,
      cmd = { "clangd", "--enable-config" },
    },
    extensions = {
      autoSetHints = false,
    },
  })

  -- lspconfig.clangd.setup({
  --   on_attach = function(client, bufnr)
  --     lsp_global_attach(client, bufnr)
  --     lsp_format.on_attach(client, bufnr)
  --   end,
  --   capabilities = global_capabilities,
  -- })
end

return M
