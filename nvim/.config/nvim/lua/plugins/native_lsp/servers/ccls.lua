local lspconfig = require("lspconfig")
local lsp_format = require("lsp-format")
local plugin_lsp = require("utils.native_lsp")

local M = {}

function M.init()
  if true then
    return nil
  end
  lspconfig.ccls.setup({
    enabled = false,
    on_attach = function(client, bufnr)
      plugin_lsp.common_on_attach(client, bufnr)
      lsp_format.on_attach(client)
    end,
    capabilities = plugin_lsp.common_capabilities,
    root_dir = lspconfig.util.root_pattern(
      "compile_commands.json",
      ".ccls",
      ".git",
      ".clang-format"
    ),
  })
end

return M
