local lspconfig = require("lspconfig")
local plugin_lsp = require("utils.native_lsp")
local lsp_format = require("lsp-format")

local M = {}

function M.init()
  local servers = {
    "html",
    "cssls",
    "stylelint_lsp",
    "cmake",
    "bashls",
    "dockerls",
    "zls",
    "prismals",
    "dartls",
    "sqlls",
    "csharp_ls",
    "unocss",
    "jdtls",
    "marksman",
    "typst_lsp",
    "tailwindcss",
    "kotlin_language_server",
    -- "emmet_language_server",
    "mdx_analyzer",
    "basedpyright",
  }

  for _, server in ipairs(servers) do
    lspconfig[server].setup({
      on_attach = plugin_lsp.common_on_attach,
      capabilities = plugin_lsp.common_capabilities,
    })
  end

  local servers_with_format = { "biome", "hls", "asm_lsp", "ruff", "taplo" }

  for _, server in ipairs(servers_with_format) do
    lspconfig[server].setup({
      on_attach = function(client, bufnr)
        plugin_lsp.common_on_attach(client, bufnr)
        lsp_format.on_attach(client, bufnr)
      end,
      capabilities = plugin_lsp.common_capabilities,
    })
  end
end

return M
