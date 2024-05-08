local scan = require("plenary.scandir")
local module_path = ...

local M = {}

M.init = function() end
M.init_all = function()
  for _, file in
    ipairs(
      scan.scan_dir(
        vim.fn.stdpath("config") .. "/lua/plugins/native_lsp/servers"
      )
    )
  do
    local m = file:match(".+/(.+).lua$")
    if m and m ~= "init" then
      require(module_path .. "." .. m).init()
    end
  end
end

return M
