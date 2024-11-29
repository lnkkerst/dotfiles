return {
  {
    "glepnir/dashboard-nvim",
    enabled = false,
    config = function()
      local dashboard = require("dashboard")

      dashboard.setup({
        theme = "doom",
        config = {
          header = {
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
          },
          center = {
            {
              icon = "󰈞  ",
              desc = "Find  File                                        ",
              action = "Telescope find_files",
              key = "<Leader> f f",
            },
            {
              icon = "󱑂  ",
              desc = "Recently opened files",
              action = "Telescope frecency",
              key = "<Leader> f r",
            },
            {
              icon = "  ",
              desc = "Project grep",
              action = "Telescope live_grep",
              key = "<Leader> f g",
            },
            {
              icon = "  ",
              desc = "New file",
              action = "enew",
              key = "e",
            },
            {
              icon = "󰗼  ",
              desc = "Quit Nvim",
              action = "qa",
              key = "q",
            },
          },
        },
      })

      vim.cmd([[
  augroup dashboard_enter
    au!
    autocmd FileType dashboard nnoremap <buffer> q :qa<CR>
    autocmd FileType dashboard nnoremap <buffer> e :enew<CR>
  augroup END
  ]])
    end,
  },
}
