local options = {
  termguicolors = true,
  mouse = "a",
  errorbells = false,
  visualbell = true,
  hidden = true,
  fileformats = "unix,mac,dos",
  magic = true,
  virtualedit = "block",
  encoding = "utf-8",
  viewoptions = "folds,cursor,curdir,slash,unix",
  sessionoptions = "curdir,help,tabpages,winsize",
  clipboard = not require("utils.conditions").is_ssh_session()
      and "unnamed,unnamedplus"
    or nil,
  wildignorecase = true,
  wildignore = ".git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**",
  backup = false,
  writebackup = false,
  swapfile = false,
  history = 2000,
  shada = "!,'300,<50,@100,s10,h",
  backupskip = "/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim",
  smarttab = true,
  shiftround = true,
  timeout = true,
  ttimeout = true,
  timeoutlen = 500,
  ttimeoutlen = 0,
  updatetime = 100,
  redrawtime = 1500,
  ignorecase = true,
  smartcase = true,
  infercase = true,
  incsearch = true,
  wrapscan = true,
  complete = ".,w,b,k",
  inccommand = "nosplit",
  grepformat = "%f:%l:%c:%m",
  grepprg = "rg --hidden --vimgrep --smart-case --",
  breakat = [[\ \	;:,!?]],
  startofline = false,
  whichwrap = "h,l,<,>,[,],~",
  splitbelow = true,
  splitright = true,
  switchbuf = "useopen",
  backspace = "indent,eol,start",
  diffopt = "filler,iwhite,internal,algorithm:patience",
  completeopt = "menu,menuone,noselect",
  jumpoptions = "stack",
  showmode = false,
  shortmess = "aoOTIcF",
  scrolloff = 2,
  sidescrolloff = 5,
  foldlevelstart = 99,
  ruler = false,
  cursorline = true,
  cursorcolumn = true,
  showtabline = 0,
  winwidth = 30,
  winminwidth = 10,
  pumheight = 15,
  helpheight = 12,
  previewheight = 12,
  showcmd = false,
  cmdheight = 2,
  cmdwinheight = 5,
  equalalways = false,
  laststatus = 0,
  display = "lastline",
  showbreak = "↳  ",
  -- pumblend = 10,
  -- winblend = 10,
  autoread = true,
  autowrite = true,
  undofile = true,
  synmaxcol = 2500,
  formatoptions = "1jcroql",
  textwidth = 80,
  expandtab = true,
  autoindent = true,
  smartindent = true,
  tabstop = 4,
  shiftwidth = 4,
  softtabstop = -1,
  breakindentopt = "shift:2,min:20",
  wrap = false,
  linebreak = true,
  number = true,
  relativenumber = true,
  foldenable = true,
  signcolumn = "yes",
  conceallevel = 0,
  concealcursor = "niv",

  list = true,
  listchars = {
    tab = "»·",
    nbsp = "+",
    trail = "·",
    extends = "→",
    precedes = "←",
  },
}

local globals = {
  mapleader = " ",
  speeddating_no_mappings = 1,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

for k, v in pairs(globals) do
  vim.g[k] = v
end
