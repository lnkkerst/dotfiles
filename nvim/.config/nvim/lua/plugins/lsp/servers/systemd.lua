local M = {}

function M.init()
  local lspconfig = require("lspconfig")
  local configs = require("lspconfig.configs")

  if not configs.systemd_ls then
    configs.systemd_ls = {
      default_config = {
        cmd = { "systemd-language-server" },
        filetypes = { "systemd" },
        root_dir = function()
          return nil
        end,
        single_file_support = true,
        settings = {},
      },
      docs = {
        description = [[
https://github.com/psacawa/systemd-language-server

Language Server for Systemd unit files.
]],
      },
    }
  end

  lspconfig.systemd_ls.setup({})
end

return M
