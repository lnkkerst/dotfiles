pcall(require, "impatient")

vim.g.os = vim.loop.os_uname().sysname
vim.g.open_command = "xdg-open"
vim.g.mapleader = " "

require("neovide")
require("internal.packer_commands")
require("plugins")
require("impatient")
require("options")
require("autocmd")
require("keymap")
