require("toggleterm").setup({
  open_mapping = [[<C-\>]],
  shade_terminals = false,
  start_in_insert = true,
  insert_mappings = true,
  terminal_mappings = true,
  float_opts = {
    border = "single",
  },
})

function _G.set_terminal_keymaps()
  if vim.g.vscode then
    return
  end

  local opts = { buffer = 0 }
  vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
  -- vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
  vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

local Terminal = require("toggleterm.terminal").Terminal

local lazygit = Terminal:new({
  cmd = "lazygit",
  hidden = true,
  direction = "float",
})

vim.api.nvim_create_user_command("Lazygit", function()
  lazygit:toggle()
end, {})

local floatterm = Terminal:new({
  hidden = true,
  direction = "float",
})

vim.api.nvim_create_user_command("FloatTerm", function()
  floatterm:toggle()
end, {})

local ranger = Terminal:new({
  cmd = "ranger",
  hidden = true,
  direction = "float",
})

vim.api.nvim_create_user_command("Ranger", function()
  ranger:toggle()
end, {})
