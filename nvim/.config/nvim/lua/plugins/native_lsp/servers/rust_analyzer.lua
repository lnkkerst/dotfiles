local rt = require("rust-tools")
local plugin_lsp = require("utils.native_lsp")
local util = require("lspconfig.util")

local M = {}

function M.init()
  rt.setup({
    server = {
      on_attach = function(client, bufnr)
        plugin_lsp.common_on_attach(client, bufnr)
        require("lsp-format").on_attach(client, bufnr)
      end,
      capabilities = plugin_lsp.common_capabilities,
      root_dir = function(filepath, bufnr)
        local res = util.find_git_ancestor(filepath, bufnr)
        if res then
          return res
        end
        res = util.root_pattern("src-tauri")(filepath, bufnr)
        if res then
          return res
        end
        return util.root_pattern("Cargo.toml", "rust-project.json")(
          filepath,
          bufnr
        )
      end,
    },
    tools = {
      inlay_hints = {
        auto = false,
      },
      hover_actions = {
        auto_focus = true,
        border = "single",
      },
    },
  })
end

return M
