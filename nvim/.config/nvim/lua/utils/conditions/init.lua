local M = {}

M.use_prettier = function()
  local null_utils = require("null-ls.utils").make_conditional_utils()
  return null_utils.root_has_file_matches(".*prettierrc.*")
end

M.use_biome = function()
  local null_utils = require("null-ls.utils").make_conditional_utils()
  return null_utils.root_has_file_matches("biome.json")
end

return M
