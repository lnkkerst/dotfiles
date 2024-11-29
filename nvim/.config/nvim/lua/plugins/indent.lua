local disabled_filetypes = {
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
  "OverseerForm",
  "lazy",
  "trouble",
  "mason",
  "toggleterm",
  "snacks_dashboard",
  "snacks_notif",
  "snacks_terminal",
  "snacks_win",
  "neo-tree",
}

return {
  {
    "echasnovski/mini.indentscope",
    event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    version = "*",
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = disabled_filetypes,
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
    opts = {
      draw = {
        delay = 50,
        animation = function()
          return 0
        end,
      },
      options = {
        indent_at_cursor = false,
        try_as_border = true,
      },
      symbol = "│",
    },
  },
}
