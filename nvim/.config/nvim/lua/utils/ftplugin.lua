local M = {}

function M.create_term_run_cpp_command()
  local runner
  local has_toggleterm, toggleterm = pcall(require, "toggleterm")
  local has_snacks, snacks = pcall(require, "snacks")
  if has_toggleterm then
    runner = function(cmd)
      toggleterm.exec(cmd, nil, nil, nil, nil, nil, false)
    end
  elseif has_snacks then
    runner = function(cmd)
      snacks.terminal(string.format("%s; read", cmd))
    end
  end

  if runner == nil then
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

    runner(cmd)
  end, {
    desc = "Compile and run current cpp file",
    nargs = "?",
    complete = function()
      return { "compile_only" }
    end,
  })
end

return M
