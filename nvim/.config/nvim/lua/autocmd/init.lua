local function create_augroups(augroups)
  for k, v in pairs(augroups) do
    vim.api.nvim_command("augroup " .. k)
    vim.api.nvim_command("autocmd!")
    for _, def in ipairs(v) do
      vim.api.nvim_command(
        table.concat(vim.tbl_flatten({ "autocmd", def }), " ")
      )
    end
    vim.api.nvim_command("augroup END")
  end
end

local augroups = {
  bufs = {
    { "BufWritePre", "/tmp/*", "setlocal noundofile" },
    { "BufWritePre", "COMMIT_EDITMSG", "setlocal noundofile" },
    { "BufWritePre", "MERGE_MSG", "setlocal noundofile" },
    { "BufWritePre", "*.tmp", "setlocal noundofile" },
    { "BufWritePre", "*.bak", "setlocal noundofile" },
  },
  wins = {
    -- Check if file changed when its window is focus, more eager than 'autoread'
    { "FocusGained", "*", "checktime" },
    -- Equalize window dimensions when resizing vim window
    { "VimResized", "*", [[tabdo wincmd =]] },
  },
  ft = {
    -- { "FileType", "markdown", "set wrap" },
    { "FileType", "make", "set noexpandtab shiftwidth=8 softtabstop=0" },
    { "FileType", "dap-repl", "lua require('dap.ext.autocompl').attach()" },
  },
}

create_augroups(augroups)
