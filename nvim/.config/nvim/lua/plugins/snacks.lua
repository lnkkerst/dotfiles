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
    scratch = {},
    picker = {
      layout = {
        preset = "dropdown",
      },
      sources = {},
      layouts = {
        select = {
          layout = {
            border = "single",
          },
        },
        dropdown = {
          layout = {
            backdrop = false,
            row = 1,
            width = 0.6,
            min_width = 80,
            height = 0.8,
            border = "none",
            box = "vertical",
            {
              win = "preview",
              title = "{preview}",
              height = 0.6,
              border = "single",
            },
            {
              box = "vertical",
              border = "single",
              title = "{title} {live} {flags}",
              title_pos = "center",
              { win = "input", height = 1, border = "bottom" },
              { win = "list", border = "none" },
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
      scratch = {
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
      -- bufdelete
      {
        "<S-q>",
        function()
          require("snacks").bufdelete()
        end,
        desc = "Delete current buffer",
      },
      {
        "<leader>bd",
        function()
          require("snacks").bufdelete()
        end,
        desc = "Delete current buffer",
      },

      -- picker
      {
        "<leader>fn",
        function()
          ---@diagnostic disable-next-line: undefined-field
          require("snacks").picker.notifications({
            confirm = "focus_preview",
          })
        end,
        desc = "Pick notifications",
      },
      {
        "<leader>ff",
        function()
          require("snacks").picker()
        end,
        desc = "Pick pickers",
      },
      {
        "<leader>fg",
        function()
          require("snacks").picker.grep()
        end,
        desc = "Pick grep results",
      },
      {
        "<leader>fb",
        function()
          require("snacks").picker.buffers()
        end,
        desc = "Pick buffers",
      },
      {
        "<leader>fm",
        function()
          require("snacks").picker.marks()
        end,
        desc = "Pick marks",
      },
      {
        "<leader>fj",
        function()
          require("snacks").picker.jumps()
        end,
        desc = "Pick jump list",
      },
      {
        "<leader>fq",
        function()
          require("snacks").picker.qflist()
        end,
        desc = "Pick quickfix list",
      },
      {
        "<leader>fl",
        function()
          require("snacks").picker.loclist()
        end,
        desc = "Pick location list",
      },
      {
        "<C-p>",
        function()
          require("snacks").picker.files()
        end,
        desc = "Pick files",
      },

      {
        "<M-f>",
        function()
          require("snacks").zen()
        end,
        desc = "Toggle Zen Mode",
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
