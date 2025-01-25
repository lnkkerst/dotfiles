local options = {
  -- Enable autowrite (auto save)
  autowrite = true,

  -- Copy indent
  autoindent = true,

  -- Enable system clipboard if not in ssh
  clipboard = not require("utils.conditions").is_ssh_session()
      and "unnamed,unnamedplus"
    or nil,

  completeopt = "menu,menuone,noselect",

  conceallevel = 0,
  concealcursor = "niv",

  -- Confirm to save changes
  confirm = true,

  -- Highlight current cursor
  cursorline = true,
  cursorcolumn = true,

  -- Use spaces instead of tabs
  expandtab = true,

  --formatoptions = "1jcroql",
  formatoptions = "jcroqlnt",

  -- Grep
  grepformat = "%f:%l:%c:%m",
  grepprg = "rg --hidden --vimgrep --smart-case --",

  ignorecase = true,

  -- Preview command results
  inccommand = "nosplit",

  jumpoptions = "stack",

  -- For global statusline
  laststatus = 3,

  -- Wrap lines
  linebreak = true,

  -- Show some invisible characters (tabs...
  list = true,
  listchars = {
    tab = "»·",
    nbsp = "+",
    trail = "·",
    extends = "→",
    precedes = "←",
  },

  -- Enable mouse support
  mouse = "a",

  -- Relative line number
  number = true,
  relativenumber = true,

  -- Popup
  pumblend = 10,
  pumheight = 15,

  -- Disable default ruler
  ruler = false,

  -- Minimum line offset
  scrolloff = 4,

  -- Persistence for `mksession`
  sessionoptions = {
    "buffers",
    "curdir",
    "tabpages",
    "winsize",
    "help",
    "globals",
    "skiprtp",
    "folds",
  },

  -- Minimal column offset
  sidescrolloff = 8,

  -- Round indent
  shiftround = true,

  -- Indent size
  shiftwidth = 2,

  -- Shorten messages
  shortmess = "aoOTIcF",

  -- Don't show mode, use plugin's
  showmode = false,

  -- Always show sign column
  signcolumn = "yes",

  smartcase = true,
  smartindent = true,
  smarttab = true,

  -- Put new windows below current
  splitbelow = true,

  -- Put new windows right of current
  splitright = true,

  splitkeep = "screen",

  -- Tab width
  tabstop = 4,
  softtabstop = -1,

  -- True color support
  termguicolors = true,

  -- Timeout
  timeout = true,
  ttimeout = true,
  timeoutlen = 500,
  ttimeoutlen = 0,

  -- Enable undo file
  undofile = true,

  -- Larger undo levels
  undolevels = 10000,

  -- Save swap file and trigger CursorHold
  updatetime = 200,

  -- Allow cursor to move where there is no text in visual block mode
  virtualedit = "block",

  -- Command-line completion mode
  wildmode = "longest:full,full",

  -- Minimum window width
  winminwidth = 10,

  -- disable line wrap
  wrap = false,

  -- Disable bell for error
  errorbells = false,

  -- Use visual bell instead of beeping.
  visualbell = true,

  -- Enable buffer hidden
  hidden = true,

  -- Default EOL formats
  fileformats = "unix,mac,dos",

  -- Effect for `mkview`
  viewoptions = "folds,cursor,curdir,slash,unix",

  --wildignorecase = true,
  --wildignore = ".git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**",

  -- Disable backup
  backup = false,
  writebackup = false,
  backupskip = "/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim",

  -- Disable swapfile
  swapfile = false,

  -- History size
  history = 2000,

  -- Command line height
  cmdheight = 2,
  cmdwinheight = 5,

  -- Blend for floating window
  --winblend = 10,

  shada = "!,'300,<50,@100,s10,h",
  redrawtime = 1500,
  infercase = true,
  incsearch = true,
  wrapscan = true,
  complete = ".,w,b,k",
  breakat = [[\ \	;:,!?]],
  startofline = false,
  whichwrap = "h,l,<,>,[,],~",
  switchbuf = "useopen",
  backspace = "indent,eol,start",
  diffopt = "filler,iwhite,internal,algorithm:patience",
  winwidth = 30,
  helpheight = 12,
  previewheight = 12,
  showcmd = true,
  showcmdloc = "statusline",
  equalalways = false,
  showbreak = "↳  ",
  autoread = true,
  synmaxcol = 2500,
  breakindentopt = "shift:2,min:20",
}

local globals = {
  -- default_file_explorer = "nvim-tree",
  default_file_explorer = "neo-tree",
  default_terminal = "toggleterm",
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

for k, v in pairs(globals) do
  vim.g[k] = v
end
