local M = {}

function M.executable(name)
  if vim.fn.executable(name) > 0 then
    return true
  end

  return false
end
