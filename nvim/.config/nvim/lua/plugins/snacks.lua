local header = [[
███████╗ ███╗   ███╗  █████╗   ██████╗ ███████╗
██╔════╝ ████╗ ████║ ██╔══██╗ ██╔════╝ ██╔════╝
█████╗   ██╔████╔██║ ███████║ ██║      ███████╗
██╔══╝   ██║╚██╔╝██║ ██╔══██║ ██║      ╚════██║
███████╗ ██║ ╚═╝ ██║ ██║  ██║ ╚██████╗ ███████║
╚══════╝ ╚═╝     ╚═╝ ╚═╝  ╚═╝  ╚═════╝ ╚══════╝]]

return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
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
    indent = {
      enabled = true,
      animate = { enabled = false },
      indent = {},
    },
    scope = { enabled = true },
    terminal = {
      win = {
        height = 0.3,
      },
    },
    lazygit = {
      configure = true,
    },
    input = {},
    picker = {
      layout = {
        preset = "telescope",
      },
      sources = {},
      layouts = {
        sidebar = {
          preview = "main",
          layout = {
            backdrop = false,
            width = 40,
            min_width = 40,
            height = 0,
            position = "left",
            border = "none",
            box = "vertical",
            {
              win = "input",
              height = 1,
              border = "none",
              title = "{title} {live} {flags}",
              title_pos = "center",
            },
            { win = "list", border = "none" },
            {
              win = "preview",
              title = "{preview}",
              height = 0.4,
              border = "top",
            },
          },
        },
        telescope = {
          reverse = true,
          layout = {
            box = "horizontal",
            backdrop = false,
            width = 0.8,
            height = 0.85,
            border = "none",
            {
              box = "vertical",
              {
                win = "list",
                title = " Results ",
                title_pos = "center",
                border = "single",
              },
              {
                win = "input",
                height = 1,
                border = "single",
                title = "{title} {live} {flags}",
                title_pos = "center",
              },
            },
            {
              win = "preview",
              title = "{preview:Preview}",
              width = 0.45,
              border = "single",
              title_pos = "center",
            },
          },
        },
      },
    },
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
      input = {
        border = "single",
        relative = "cursor",
        row = -3,
        col = 0,
        width = 30,
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
      -- bufdelete
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

      -- picker
      {
        "<leader>fn",
        function()
          ---@diagnostic disable-next-line: undefined-field
          require("snacks").picker.notifications()
        end,
      },
      {
        "<leader>ff",
        function()
          require("snacks").picker()
        end,
      },
      {
        "<leader>fg",
        function()
          require("snacks").picker.grep()
        end,
      },
      {
        "<leader>fb",
        function()
          require("snacks").picker.buffers()
        end,
      },
      {
        "<leader>fm",
        function()
          require("snacks").picker.marks()
        end,
      },
      {
        "<leader>fj",
        function()
          require("snacks").picker.jumps()
        end,
      },
      {
        "<C-p>",
        function()
          require("snacks").picker.files()
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
}
