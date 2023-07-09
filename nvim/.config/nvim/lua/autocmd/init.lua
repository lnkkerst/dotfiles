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
    -- Reload vim config automatically
    {
      "BufWritePost",
      [[$VIM_PATH/{*.vim,*.yaml,vimrc} nested source $MYVIMRC | redraw]],
    }, -- Reload Vim script automatically if setlocal autoread
    {
      "BufWritePost,FileWritePost",
      "*.vim",
      [[nested if &l:autoread > 0 | source <afile> | echo 'source ' . bufname('%') | endif]],
    },
    { "BufWritePre", "/tmp/*", "setlocal noundofile" },
    { "BufWritePre", "COMMIT_EDITMSG", "setlocal noundofile" },
    { "BufWritePre", "MERGE_MSG", "setlocal noundofile" },
    { "BufWritePre", "*.tmp", "setlocal noundofile" },
    { "BufWritePre", "*.bak", "setlocal noundofile" },
    -- auto EslintFixAll
    -- {
    --   "InsertLeave",
    --   "{*.js,*.ts,*.vue,*.jsx.*.tsx,*.cjs,*.mjs}",
    --   "EslintFixAll",
    -- },
    -- auto change directory
    -- { "BufEnter", "*", "silent! lcd %:p:h" }, -- auto place to last edit
    -- {
    --     "BufReadPost", "*",
    --     [[if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | endif]]
    -- },
    -- {
    --     "BufEnter", "*",
    --     [[++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif]]
    -- }
  },
  wins = {
    -- Highlight current line only on focused window
    {
      "WinEnter,BufEnter,InsertLeave",
      "*",
      [[if ! &cursorline && &filetype !~# '^\(dashboard\|clap_\)' && ! &pvw | setlocal cursorline | endif]],
    },
    {
      "WinLeave,BufLeave,InsertEnter",
      "*",
      [[if &cursorline && &filetype !~# '^\(dashboard\|clap_\)' && ! &pvw | setlocal nocursorline | endif]],
    },
    -- Force write shada on leaving nvim
    -- {
    --     "VimLeave", "*",
    --     [[if has('nvim') | wshada! | else | wviminfo! | endif]]
    -- },
    -- Check if file changed when its window is focus, more eager than 'autoread'
    { "FocusGained", "*", "checktime" },
    -- Equalize window dimensions when resizing vim window
    { "VimResized", "*", [[tabdo wincmd =]] },
  },
  ft = {
    -- { "FileType", "markdown", "set wrap" },
    { "FileType", "make", "set noexpandtab shiftwidth=8 softtabstop=0" },
    -- Google tab style
    -- { "FileType", "c,cpp", "set expandtab tabstop=2 shiftwidth=2" },
    { "FileType", "dap-repl", "lua require('dap.ext.autocompl').attach()" },
    -- {
    --     "FileType", "dashboard",
    --     "set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2"
    -- },
    -- {
    --     "FileType", "*",
    --     [[setlocal formatoptions-=c formatoptions-=r formatoptions-=o]]
    -- },
    -- {
    --     "FileType", "c,cpp",
    --     "nnoremap <leader>h :ClangdSwitchSourceHeaderVSplit<CR>"
    -- }
  },
  -- yank = {
  --   {
  --     "TextYankPost",
  --     "*",
  --     [[silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=300})]],
  --   },
  -- },
  -- toggleterm = {
  --   { "TermOpen", "term://*", "lua set_terminal_keymaps()" },
  -- },
}

create_augroups(augroups)
