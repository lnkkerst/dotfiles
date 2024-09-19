local M = {}

function M.create_term_run_cpp_command()
  local ok, toggleterm = pcall(require, "toggleterm")
  if not ok then
    return
  end

  vim.api.nvim_create_user_command("RunCpp", function(opts)
    local dir = vim.fn.expand("%:p:h")
    local file = vim.fn.expand("%:t")
    local out_file = vim.fn.expand("%:t:r")

    local cmd = string.format(
      "cd %s && g++ -std=c++20 -Wall -Wextra -g -O2 -fsanitize=address,undefined -o %s %s",
      dir,
      out_file,
      file
    )

    if #opts.args == 0 then
      cmd = string.format("%s && ./%s", cmd, out_file)
    end

    toggleterm.exec(cmd, nil, nil, nil, nil, nil, false)
  end, {
    nargs = "?",
    complete = function()
      return { "compile_only" }
    end,
  })
end

return M
