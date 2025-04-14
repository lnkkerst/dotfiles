local lspconfig = require("lspconfig")
local configs = require("lspconfig.configs")
local lsp_format = require("lsp-format")
local plugin_lsp = require("utils.lsp")

local M = {}

function M.init()
  if not configs.oxlint then
    configs.oxlint = {
      default_config = {
        cmd = { "oxc_language_server" },
        root_dir = lspconfig.util.root_pattern("oxlint.json"),
        filetypes = {
          "javascript",
          "typescript",
          "javascriptreact",
          "typescriptreact",
          "vue",
        },
      },
    }
  end
  lspconfig.oxlint.setup({
    enabled = false,
    on_attach = function(client, bufnr)
      plugin_lsp.common_on_attach(client, bufnr)
      lsp_format.on_attach(client)
    end,
    capabilities = plugin_lsp.common_capabilities,
  })
end

return M
