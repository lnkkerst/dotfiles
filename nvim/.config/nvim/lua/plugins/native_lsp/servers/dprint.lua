local lspconfig = require("lspconfig")
local lsp_format = require("lsp-format")
local plugin_lsp = require("utils.native_lsp")
local util = require("lspconfig.util")

local M = {}

local filetypes = {
  "javascript",
  "javascriptreact",
  "typescript",
  "typescriptreact",
  "json",
  "jsonc",
  "markdown",
  "python",
  "toml",
  "rust",
  "roslyn",
}
local prettier_filetypes = {
  "javascript",
  "javascriptreact",
  "typescript",
  "typescriptreact",
  "vue",
  "css",
  "scss",
  "less",
  "html",
  "json",
  "jsonc",
  "yaml",
  "markdown",
  "markdown.mdx",
  "graphql",
  "handlebars",
}

function M.init()
  lspconfig.dprint.setup({
    on_attach = function(client, bufnr)
      plugin_lsp.common_on_attach(client, bufnr)
      -- lsp_format.on_attach(client)
    end,
    capabilities = plugin_lsp.common_capabilities,
    filetypes = require("utils").merge_sets(filetypes, prettier_filetypes),
    single_file_support = false,
    root_dir = util.root_pattern(
      "dprint.json",
      ".dprint.json",
      "dprint.jsonc",
      ".dprint.jsonc"
    ),
  })
end

return M
