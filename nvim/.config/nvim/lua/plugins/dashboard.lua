local dashboard = require("dashboard")

dashboard.custom_header = {
  "                                               ",
  "                                               ",
  "███████╗ ███╗   ███╗  █████╗   ██████╗ ███████╗",
  "██╔════╝ ████╗ ████║ ██╔══██╗ ██╔════╝ ██╔════╝",
  "█████╗   ██╔████╔██║ ███████║ ██║      ███████╗",
  "██╔══╝   ██║╚██╔╝██║ ██╔══██║ ██║      ╚════██║",
  "███████╗ ██║ ╚═╝ ██║ ██║  ██║ ╚██████╗ ███████║",
  "╚══════╝ ╚═╝     ╚═╝ ╚═╝  ╚═╝  ╚═════╝ ╚══════╝",
  "                                               ",
  "                                               ",
}

dashboard.custom_center = {
  {
    icon = "  ",
    desc = "Find  File                              ",
    action = "Telescope find_files",
    shortcut = "<Leader> f f",
  },
  {
    icon = "  ",
    desc = "Recently opened files                   ",
    action = "Telescope frecency",
    shortcut = "<Leader> f r",
  },
  {
    icon = "  ",
    desc = "Project grep                            ",
    action = "Telescope live_grep",
    shortcut = "<Leader> f g",
  },
  {
    icon = "  ",
    desc = "New file                                ",
    action = "enew",
    shortcut = "e           ",
  },
  {
    icon = "  ",
    desc = "Quit Nvim                               ",
    action = "qa",
    shortcut = "q           ",
  },
}

vim.cmd([[
  augroup dashboard_enter
    au!
    autocmd FileType dashboard nnoremap <buffer> q :qa<CR>
    autocmd FileType dashboard nnoremap <buffer> e :enew<CR>
  augroup END
  ]])
