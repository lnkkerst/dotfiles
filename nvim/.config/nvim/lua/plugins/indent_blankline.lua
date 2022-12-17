vim.opt.list = true
-- vim.opt.listchars:append("space: ")
vim.opt.listchars:append("eol:↴")

require("indent_blankline").setup({
  -- char = "┊",
  space_char_blankline = " ",
  show_current_context = true,
  show_current_context_start = true,
  use_treesitter = true,
  char_highlight_list = {
    "IndentBlanklineIndent1",
    "IndentBlanklineIndent2",
    "IndentBlanklineIndent3",
    "IndentBlanklineIndent4",
    "IndentBlanklineIndent5",
    "IndentBlanklineIndent6",
  },
  filetype_exclude = {
    "startify",
    "dashboard",
    "dotooagenda",
    "log",
    "fugitive",
    "gitcommit",
    "packer",
    "vimwiki",
    "markdown",
    "txt",
    "vista",
    "help",
    "todoist",
    "NvimTree",
    "peekaboo",
    "git",
    "TelescopePrompt",
    "undotree",
    "flutterToolsOutline",
    "alpha",
  },
  buftype_exclude = { "terminal", "nofile", "telescope" },
})
