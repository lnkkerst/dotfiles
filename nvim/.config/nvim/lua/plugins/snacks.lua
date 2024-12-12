local header = [[
███████╗ ███╗   ███╗  █████╗   ██████╗ ███████╗
██╔════╝ ████╗ ████║ ██╔══██╗ ██╔════╝ ██╔════╝
█████╗   ██╔████╔██║ ███████║ ██║      ███████╗
██╔══╝   ██║╚██╔╝██║ ██╔══██║ ██║      ╚════██║
███████╗ ██║ ╚═╝ ██║ ██║  ██║ ╚██████╗ ███████║
╚══════╝ ╚═╝     ╚═╝ ╚═╝  ╚═╝  ╚═════╝ ╚══════╝]]

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
          header = header,
        },
      },
      scroll = { enabled = false },
      indent = { enabled = true },
      scope = { enabled = true },
      terminal = { win = {
        height = 0.2,
      } },
      styles = {
        ["notification.history"] = {
          border = "single",
        },
        terminal = {
          border = "single",
        },
        notification = {
          border = "single",
        },
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
    keys = function()
      local keys = {
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
        {
          "<M-f>",
          function()
            require("snacks").zen()
          end,
        },
      }

      if vim.g.default_terminal == "snacks" then
        table.insert(keys, {
          [[<C-\>]],
          function()
            require("snacks").terminal.toggle()
          end,
          mode = { "i", "n", "t" },
        })
      end
      return keys
    end,
    config = function(_, opts)
      local snacks = require("snacks")
      snacks.setup(opts)

      vim.api.nvim_create_user_command("Gitbrowse", function()
        snacks.gitbrowse()
      end, { desc = "Browse the repo of current file" })

      vim.api.nvim_create_user_command("Lazygit", function()
        snacks.lazygit()
      end, { desc = "Open lazygit" })

      snacks.indent.animate()

      -- Rename for nvim-tree
      local prev = { new_name = "", old_name = "" } -- Prevents duplicate events
      vim.api.nvim_create_autocmd("User", {
        pattern = "NvimTreeSetup",
        callback = function()
          local events = require("nvim-tree.api").events
          events.subscribe(events.Event.NodeRenamed, function(data)
            if
              prev.new_name ~= data.new_name or prev.old_name ~= data.old_name
            then
              data = data
              snacks.rename.on_rename_file(data.old_name, data.new_name)
            end
          end)
        end,
      })
    end,
  },
}
