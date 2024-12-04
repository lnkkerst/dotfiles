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

  {
    "akinsho/bufferline.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons", "catppuccin/nvim" },
    event = "VeryLazy",
    keys = {
      {
        "<A-S-j>",
        "<cmd>BufferLineMoveNext<cr>",
        desc = "Move buffer next",
      },
      {
        "<A-S-k>",
        "<cmd>BufferLineMovePrev<cr>",
        desc = "Move buffer prev",
      },
      {
        "<A-n>",
        "<cmd>BufferLineCycleNext<cr>",
        desc = "Next buffer",
      },
      {
        "<A-p>",
        "<cmd>BufferLineCyclePrev<cr>",
        desc = "Prev buffer",
      },

      { "<leader>bp", "<cmd>BufferLinePick<cr>", desc = "BufferLinePick" },
    },
    opts = function()
      return {
        options = {
          close_command = function(n)
            require("snacks").bufdelete(n)
          end,
          right_mouse_command = function(n)
            require("snacks").bufdelete(n)
          end,
          mod = "buffers",
          numbers = "ordinal",
          diagnostics = "nvim_lsp",
          always_show_bufferline = false,
          offsets = {
            {
              filetype = vim.g.file_explorer == "nvim-tree" and "NvimTree"
                or "neo-tree",
              text = "File Explorer",
              text_align = "center",
              padding = 1,
            },
          },
        },
        highlights = require("catppuccin.groups.integrations.bufferline").get(),
      }
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    opts = function()
      ---@diagnostic disable: unused-local, unused-function

      local function lsp()
        local clients = vim.lsp.get_clients()
        local buf = vim.api.nvim_get_current_buf()
        clients = vim
          .iter(clients)
          :filter(function(client)
            return client.attached_buffers[buf]
          end)
          :filter(function(client)
            return client.name ~= "GitHub Copilot"
          end)
          :map(function(client)
            return " " .. client.name
          end)
          :totable()
        local info = table.concat(clients, " ")
        if info == "" then
          return "No attached LSP server"
        else
          return info
        end
      end

      local function dap()
        ---@diagnostic disable-next-line: redefined-local
        local dap = package.loaded["dap"]
        if dap then
          return dap.status()
        end
        return ""
      end

      local function dap_or_lsp()
        if dap() ~= "" then
          return dap()
        else
          return lsp()
        end
      end

      local function modified()
        if vim.bo.modified then
          return "+"
        elseif vim.bo.modifiable == false or vim.bo.readonly == true then
          return "-"
        end
        return ""
      end

      -- selene: allow(unused_variable)
      local function search_result()
        if vim.v.hlsearch == 0 then
          return ""
        end
        local last_search = vim.fn.getreg("/")
        if not last_search or last_search == "" then
          return ""
        end
        local searchcount = vim.fn.searchcount({ maxcount = 9999 })
        return last_search
          .. "("
          .. searchcount.current
          .. "/"
          .. searchcount.total
          .. ")"
      end

      local conditions = {
        buffer_not_empty = function()
          return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
        end,
        hide_in_width = function()
          return vim.fn.winwidth(0) > 60
        end,
        check_git_workspace = function()
          local filepath = vim.fn.expand("%:p:h")
          local gitdir = vim.fn.finddir(".git", filepath .. ";")
          return gitdir and #gitdir > 0 and #gitdir < #filepath
        end,
      }

      return {
        options = {
          icons_enabled = true,
          theme = "catppuccin",
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          disabled_filetypes = {
            statusline = {
              "dashboard",
              "alpha",
              "ministarter",
              "snacks_dashboard",
            },
          },
          always_divide_middle = true,
          globalstatus = true,
        },

        sections = {
          lualine_a = { "mode" },
          lualine_b = {
            { "branch" },
            {
              "diff",
              cond = conditions.hide_in_width,
            },
          },
          lualine_c = {
            dap_or_lsp,
          },
          lualine_x = {
            { "diagnostics" },
          },
          lualine_y = {
            { modified },
            { "filetype" },
            { "encoding" },
            { "fileformat" },
          },
          lualine_z = { "progress", "location" },
        },

        extensions = {
          "nvim-tree",
          "neo-tree",
          "toggleterm",
          "nvim-dap-ui",
          "quickfix",
          "aerial",
          "fzf",
          "lazy",
          "man",
          "mason",
          "oil",
          "overseer",
          "toggleterm",
          "trouble",
        },
      }
    end,
  },

  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    opts = {
      input = {
        border = "single",
      },
      select = {
        enabled = true,
        backend = { "telescope", "fzf_lua", "fzf", "builtin", "nui" },
        telescope = {
          border = {},
          borderchars = {
            "─",
            "│",
            "─",
            "│",
            "┌",
            "┐",
            "┘",
            "└",
          },
        },
      },
    },
  },

  {
    "rcarriga/nvim-notify",
    enabled = false,
    opts = {
      -- level = "info",
      stages = "static",
      render = "minimal",
      timeout = 1500,
      background_colour = "Normal",
      minimum_width = 36,
      icons = {
        ERROR = "",
        WARN = "",
        INFO = "",
        DEBUG = "",
        TRACE = "✎",
      },
    },
    config = function(_, opts)
      local notify = require("notify")
      notify.setup(opts)

      vim.notify = notify
    end,
  },

  {
    "nvim-zh/colorful-winsep.nvim",
    event = { "WinLeave" },
    opts = {},
  },
}
