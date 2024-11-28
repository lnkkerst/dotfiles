local utils = require("utils")

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

-- Auto create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = vim.api.nvim_create_augroup("auto_create_dir", { clear = true }),
  callback = function(event)
    if event.match:match("^%w%w+:[\\/][\\/]") then
      return
    end
    local file = vim.uv.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})

-- Go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
  group = vim.api.nvim_create_augroup("last_loc", { clear = true }),
  callback = function(event)
    local exclude = { "gitcommit" }
    local buf = event.buf
    if
      vim.tbl_contains(exclude, vim.bo[buf].filetype)
      or vim.b[buf].lazyvim_last_loc
    then
      return
    end
    vim.b[buf].lazyvim_last_loc = true
    local mark = vim.api.nvim_buf_get_mark(buf, '"')
    local lcount = vim.api.nvim_buf_line_count(buf)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})
