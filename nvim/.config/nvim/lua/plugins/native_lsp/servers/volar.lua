local util = require("lspconfig.util")
local lspconfig = require("lspconfig")
local plugin_lsp = require("plugins.native_lsp")

local M = {}

function M.init()
  local function get_typescript_server_path(root_dir)
    local global_ts =
      "/home/lnk/.local/share/pnpm/global/5/node_modules/typescript/lib"
    local found_ts = ""
    local function check_dir(path)
      found_ts = util.path.join(path, "node_modules", "typescript", "lib")
      if util.path.exists(found_ts) then
        return path
      end
    end
    if util.search_ancestors(root_dir, check_dir) then
      return found_ts
    else
      return global_ts
    end
  end

  lspconfig.volar.setup({
    enabled = true,
    on_attach = plugin_lsp.common_on_attach,
    capabilities = plugin_lsp.common_capabilities,
    filetypes = {
      -- "typescript",
      -- "javascript",
      -- "javascriptreact",
      -- "typescriptreact",
      "vue",
      -- "json",
      -- "sqlls",
    },
  })
end

return M
