local lspconfig = require("lspconfig")
local util = require("lspconfig.util")
local plugin_lsp = require("utils.native_lsp")

local M = {}

function M.init()
  lspconfig.rust_analyzer.setup({
    on_attach = function(client, bufnr)
      plugin_lsp.common_on_attach(client, bufnr)
      require("lsp-format").on_attach(client, bufnr)
    end,
    capabilities = plugin_lsp.common_capabilities,
    root_dir = function(filepath)
      local res = util.find_git_ancestor(filepath)
      if res then
        return res
      end
      res = util.root_pattern("src-tauri")(filepath)
      if res then
        return res
      end
      return util.root_pattern("Cargo.toml", "rust-project.json")(filepath)
    end,
  })
end

return M
