local M = {}

M.lazy_file_events = { "BufReadPost", "BufNewFile", "BufWritePre" }

function M.lazy_file()
  -- Add support for the LazyFile event
  local Event = require("lazy.core.handler.event")

  Event.mappings.LazyFile = { id = "LazyFile", event = M.lazy_file_events }
  Event.mappings["User LazyFile"] = Event.mappings.LazyFile
end

function M.executable(name)
  if vim.fn.executable(name) > 0 then
    return true
  end

  return false
end

function M.merge_sets(array1, array2)
  local merged_array = {}
  local seen = {}

  for _, value in ipairs(array1) do
    if not seen[value] then
      table.insert(merged_array, value)
      seen[value] = true
    end
  end

  for _, value in ipairs(array2) do
    if not seen[value] then
      table.insert(merged_array, value)
      seen[value] = true
    end
  end

  return merged_array
end

function M.join_strings(separator, ...)
  local result = ""
  local arg = { ... }
  for i = 1, #arg do
    if i > 1 then
      result = result .. separator
    end
    result = result .. arg[i]
  end
  return result
end

return M
