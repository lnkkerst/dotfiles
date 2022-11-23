---@diagnostic disable: missing-parameter
local ui = {}

ui.dashboard = function()
  local dashboard = require("dashboard")

  dashboard.custom_header = {
    "                                                       ",
    "                                                       ",
    "                                                       ",
    " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
    " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
    " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
    " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
    " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
    " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
    "                                                       ",
    "                                                       ",
    "                                                       ",
    "                                                       ",
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
end

ui.tokyonight = function()
  vim.g.tokyonight_style = "night"
  -- vim.cmd [[colorscheme tokyonight]]
end

ui.gruvbox_material = function()
  -- vim.cmd [[colorscheme gruvbox-material]]
end

ui.nord = function()
  -- Example config in lua
  vim.g.nord_contrast = false
  vim.g.nord_borders = false
  vim.g.nord_disable_background = false
  vim.g.nord_italic = true

  -- Load the colorscheme
  -- require('nord').set()
end

ui.catppuccin = function()
  require("catppuccin").setup({
    flavour = "mocha",
    background = {
      light = "latte",
      dark = "mocha",
    },
    transparent_background = false,
    term_colors = false,
    styles = {
      comments = { "italic" },
      conditionals = { "italic" },
    },
    integrations = {
      cmp = true,
      gitsigns = true,
      nvimtree = true,
      telescope = true,
      treesitter = true,
      aerial = true,
      dashboard = true,
      harpoon = true,
      hop = true,
      mason = true,
      neogit = true,
      neotest = true,
      noice = true,
      notify = true,
      treesitter_context = true,
      ts_rainbow = true,
      symbols_outline = {
        enabled = true,
      },
      lsp_trouble = true,
      which_key = true,
      fidget = true,
      illuminate = true,
      indent_blankline = {
        enabled = true,
        colored_indent_levels = true,
        dap = {
          enabled = true,
          enable_ui = true, -- enable nvim-dap-ui
        },
      },
      native_lsp = {
        enabled = true,
        virtual_text = {
          errors = { "italic" },
          hints = { "italic" },
          warnings = { "italic" },
          information = { "italic" },
        },
        underlines = {
          errors = { "underline" },
          hints = { "underline" },
          warnings = { "underline" },
          information = { "underline" },
        },
      },
      navic = {
        enabled = true,
        custom_bg = "NONE",
      },
    },
  })
  vim.api.nvim_command("colorscheme catppuccin")
end

ui.material = function()
  vim.g.material_style = "deep ocean"
  require("material").setup({
    contrast = {
      sidebars = false, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
      floating_windows = false, -- Enable contrast for floating windows
      line_numbers = false, -- Enable contrast background for line numbers
      sign_column = false, -- Enable contrast background for the sign column
      cursor_line = false, -- Enable darker background for the cursor line
      non_current_windows = false, -- Enable darker background for non-current windows
      popup_menu = false, -- Enable lighter background for the popup menu
    },
    italics = {
      comments = true, -- Enable italic comments
      keywords = true, -- Enable italic keywords
      functions = true, -- Enable italic functions
      strings = false, -- Enable italic strings
      variables = false, -- Enable italic variables
    },
    contrast_filetypes = {},
    high_visibility = {
      lighter = true, -- Enable higher contrast text for lighter style
      darker = true, -- Enable higher contrast text for darker style
    },
    disable = {
      borders = false, -- Disable borders between verticaly split windows
      background = false, -- Prevent the theme from setting the background (NeoVim then uses your teminal background)
      term_colors = false, -- Prevent the theme from setting terminal colors
      eob_lines = false, -- Hide the end-of-buffer lines
    },
    lualine_style = "stealth", -- Lualine style ( can be 'stealth' or 'default' )
    async_loading = true, -- Load parts of the theme asyncronously for faster startup (turned on by default)
    custom_highlights = {}, -- Overwrite highlights with your own
  })

  -- vim.cmd("colorscheme material")
end

ui.navic = function()
  local navic = require("nvim-navic")
  navic.setup({
    icons = {
      File = " ",
      Module = " ",
      Namespace = " ",
      Package = " ",
      Class = " ",
      Method = " ",
      Property = " ",
      Field = " ",
      Constructor = " ",
      Enum = "練",
      Interface = "練",
      Function = " ",
      Variable = " ",
      Constant = " ",
      String = " ",
      Number = " ",
      Boolean = "◩ ",
      Array = " ",
      Object = " ",
      Key = " ",
      Null = "ﳠ ",
      EnumMember = " ",
      Struct = " ",
      Event = " ",
      Operator = " ",
      TypeParameter = " ",
    },
    highlight = true,
    -- separator = "  ",
    depth_limit = 0,
    depth_limit_indicator = "..",
  })

  -- require("lualine").setup({
  --   sections = {
  --     lualine_c = {
  --       { navic.get_location, cond = navic.is_available },
  --     },
  --   },
  -- })
  vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
  vim.g.navic_silence = true
end

ui.lualine = function()
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

  local function modified()
    if vim.bo.modified then
      return "+"
    elseif vim.bo.modifiable == false or vim.bo.readonly == true then
      return "-"
    end
    return ""
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

  local mini_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { "location" },
  }

  local simple_sections = {
    lualine_a = { "mode" },
    lualine_b = { "filetype" },
    lualine_c = {},
    lualine_x = {},
    lualine_z = { "location" },
  }

  require("lualine").setup({
    options = {
      icons_enabled = true,
      theme = "catppuccin",
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = {},
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
        {
          function()
            local msg = "No Active Lsp"
            local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
            local clients = vim.lsp.get_active_clients()
            if next(clients) == nil then
              return msg
            end
            for _, client in ipairs(clients) do
              local filetypes = client.config.filetypes
              if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                return client.name
              end
            end
            return msg
          end,
          icon = " LSP:",
          -- color = { fg = "#ffffff", gui = "bold" },
        },
      },
      lualine_x = {
        {
          "%w",
          cond = function()
            return vim.wo.previewwindow
          end,
        },
        {
          "%r",
          cond = function()
            return vim.bo.readonly
          end,
        },
        {
          "%q",
          cond = function()
            return vim.bo.buftype == "quickfix"
          end,
        },
        { search_result, "filetype" },
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
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { "filename" },
      lualine_x = { "location" },
      lualine_y = {},
      lualine_z = {},
    },
    tabline = {},
    extensions = {
      "nvim-tree",
      "toggleterm",
      "nvim-dap-ui",
      "quickfix",
      "symbols-outline",
      {
        sections = mini_sections,
        filetypes = { "aerial" },
      },
    },
  })
end

ui.bufferline = function()
  require("bufferline").setup({
    options = {
      mod = "buffers",
      numbers = "ordinal",
      diagnostics = "nvim_lsp",
      offsets = {
        {
          filetype = "NvimTree",
          text = "File Explorer",
          text_align = "center",
          padding = 1,
        },
      },
    },
    highlights = require("catppuccin.groups.integrations.bufferline").get(),
  })
end

ui.tree = function()
  require("nvim-tree").setup({
    auto_reload_on_write = true,

    renderer = {
      icons = {
        glyphs = {
          git = {
            unstaged = "",
            staged = "",
            unmerged = "",
            renamed = "➜",
            untracked = "",
            deleted = "",
            ignored = "◌",
          },
        },
      },
    },
  })
end

ui.tree1 = function()
  require("nvim-tree").setup({
    auto_reload_on_write = true,
    disable_netrw = true,
    hijack_cursor = true,
    hijack_netrw = true,
    hijack_unnamed_buffer_when_opening = false,
    ignore_buffer_on_setup = false,
    open_on_setup = false,
    open_on_setup_file = false,
    open_on_tab = false,
    sort_by = "name",
    update_cwd = true,
    respect_buf_cwd = true,
    view = {
      adaptive_size = true,
      width = 30,
      side = "left",
      preserve_window_proportions = true,
      number = true,
      relativenumber = true,
      signcolumn = "auto",
      mappings = {
        custom_only = false,
        list = {},
      },
      float = {
        enable = false,
      },
    },
    renderer = {
      indent_markers = {
        enable = false,
        icons = { corner = "└ ", edge = "│ ", none = "  " },
      },
      icons = {
        glyphs = {
          git = {
            unstaged = "",
            staged = "",
            unmerged = "",
            renamed = "➜",
            untracked = "",
            deleted = "",
            ignored = "◌",
          },
        },
      },
    },
    hijack_directories = { enable = true, auto_open = true },
    update_focused_file = {
      enable = true,
      update_cwd = true,
      ignore_list = {},
    },
    ignore_ft_on_setup = {},
    system_open = { cmd = nil, args = {} },
    diagnostics = {
      enable = true,
      show_on_dirs = true,
      icons = { hint = "", info = "", warning = "", error = "" },
    },
    filters = { dotfiles = false, custom = {}, exclude = {} },
    git = {
      enable = true,
      ignore = true,
      timeout = 400,
    },
    actions = {
      use_system_clipboard = true,
      change_dir = { enable = true, global = false },
      open_file = {
        quit_on_open = false,
        resize_window = false,
        window_picker = {
          enable = true,
          chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
          exclude = {
            filetype = {
              "notify",
              "packer",
              "qf",
              "diff",
              "fugitive",
              "fugitiveblame",
            },
            buftype = { "nofile", "terminal", "help" },
          },
        },
      },
    },
    trash = { cmd = "trash-put", require_confirm = true },
    log = {
      enable = false,
      truncate = false,
      types = {
        all = false,
        config = false,
        copy_paste = false,
        git = false,
        profile = false,
      },
    },
  })
end

ui.transparent = function()
  require("transparent").setup({
    enable = false, -- boolean: enable transparent
    extra_groups = {},
    exclude = {}, -- table: groups you don't want to clear
  })
end

ui.scrollbar = function()
  require("scrollbar").setup()
  require("scrollbar.handlers.search").setup()
end

ui.trouble = function()
  require("trouble").setup({})
end

ui.sidebar = function()
  require("sidebar-nvim").setup({
    open = false,
  })
end

ui.dressing = function()
  require("dressing").setup({
    input = {
      border = "single",
    },
    select = {
      enabled = true,
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
  })
end

ui.noice = function()
  require("noice").setup({
    cmdline = {
      view = "cmdline",
      icons = {
        ["/"] = { icon = " ", hl_group = "DiagnosticWarn" },
        ["?"] = { icon = " ", hl_group = "DiagnosticWarn" },
        [":"] = { icon = " ", hl_group = "DiagnosticInfo", firstc = false },
      },
    },
    messages = {
      enabled = true,
      view_search = false,
    },
    popupmenu = {
      enabled = true,
      backend = "cmp",
    },
    lsp = {
      hover = {
        enabled = true,
        opts = { border = "single" },
      },
      signature = {
        enabled = true,
        auto_open = {
          enabled = false,
        },
        opts = { border = "single" },
      },
    },
  })
end

ui.winsep = function()
  require("colorful-winsep").setup({})
end

return ui
