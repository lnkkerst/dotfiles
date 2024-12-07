return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      bigfile = { enabled = true },
      notifier = {
        enabled = true,
        history = {
          border = "single",
        },
      },
      quickfile = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
      dashboard = {
        example = "compact_files",
        preset = {
          header = [[
███████╗ ███╗   ███╗  █████╗   ██████╗ ███████╗
██╔════╝ ████╗ ████║ ██╔══██╗ ██╔════╝ ██╔════╝
█████╗   ██╔████╔██║ ███████║ ██║      ███████╗
██╔══╝   ██║╚██╔╝██║ ██╔══██║ ██║      ╚════██║
███████╗ ██║ ╚═╝ ██║ ██║  ██║ ╚██████╗ ███████║
╚══════╝ ╚═╝     ╚═╝ ╚═╝  ╚═╝  ╚═════╝ ╚══════╝]],
        },
      },
      styles = {
        ["notification.history"] = {
          border = "single",
        },
      },
    },
    config = function(_, opts)
      local snacks = require("snacks")
      snacks.setup(opts)

      vim.api.nvim_create_user_command("Gitbrowse", function()
        snacks.gitbrowse()
      end, { desc = "Browse the repo of current file" })

      vim.api.nvim_create_user_command("Lazygit", function()
        snacks.lazygit()
      end, { desc = "Open lazygit" })
    end,
    keys = {
      {
        "<S-q>",
        function()
          require("snacks").bufdelete()
        end,
      },
      {
        "<leader>bd",
        function()
          require("snacks").bufdelete()
        end,
      },
      {
        "<leader>fn",
        function()
          require("snacks").notifier.show_history()
        end,
      },
    },
    init = function()
      -- selene: allow(global_usage)
      _G.dd = function(...)
        require("snacks").debug.inspect(...)
      end
      -- selene: allow(global_usage)
      _G.bt = function()
        require("snacks").debug.backtrace()
      end
      -- selene: allow(global_usage)
      vim.print = _G.dd
    end,
  },
}
