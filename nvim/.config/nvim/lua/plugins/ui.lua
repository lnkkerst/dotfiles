---@diagnostic disable: missing-parameter
local ui = {}

ui.alpha = function()
  local dashboard = require("alpha.themes.dashboard")
  local header = {
    [[███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗]],
    [[████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║]],
    [[██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║]],
    [[██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║]],
    [[██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║]],
    [[╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
  }
  dashboard.section.header.type = "text"
  dashboard.section.header.val = header
  require("alpha").setup(dashboard.config)
end

ui.dashboard = function()
  local home = os.getenv("HOME")
  local db = require("dashboard")
  -- db.preview_command = "cat | lolcat -F 0.3"
  db.preview_command = "ueberzug"
  db.preview_file_path = home .. "/Pictures/func/neovim.jpg"
  db.preview_file_height = 10
  db.preview_file_width = 30
  db.custom_center = {
    {
      icon = "  ",
      desc = "Recently latest session                  ",
      shortcut = "SPC s l",
      action = "SessionLoad",
    },
    {
      icon = "  ",
      desc = "Recently opened files                   ",
      action = "DashboardFindHistory",
      shortcut = "SPC f h",
    },
    {
      icon = "  ",
      desc = "Find  File                              ",
      action = "Telescope find_files find_command=rg,--hidden,--files",
      shortcut = "SPC f f",
    },
    {
      icon = "  ",
      desc = "File Browser                            ",
      action = "Telescope file_browser",
      shortcut = "SPC f b",
    },
    {
      icon = "  ",
      desc = "Find  word                              ",
      action = "Telescope live_grep",
      shortcut = "SPC f w",
    },
    {
      icon = "  ",
      desc = "Open Personal dotfiles                  ",
      action = "Telescope dotfiles path=" .. home .. "/.dotfiles",
      shortcut = "SPC f d",
    },
  }
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
    dim_inactive = {
      enabled = false,
      shade = "dark",
      percentage = 0.15,
    },
    transparent_background = false,
    term_colors = false,
    compile = {
      enabled = true,
      path = vim.fn.stdpath("cache") .. "/catppuccin",
    },
    styles = {
      comments = { "italic" },
      conditionals = { "italic" },
      loops = {},
      functions = {},
      keywords = {},
      strings = {},
      variables = {},
      numbers = {},
      booleans = {},
      properties = {},
      types = {},
      operators = {},
    },
    integrations = {
      treesitter = true,
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
      coc_nvim = false,
      lsp_trouble = true,
      cmp = true,
      lsp_saga = true,
      gitgutter = false,
      gitsigns = true,
      telescope = true,
      nvimtree = {
        enabled = true,
        show_root = true,
        transparent_panel = true,
      },
      neotree = {
        enabled = false,
        show_root = true,
        transparent_panel = false,
      },
      dap = {
        enabled = true,
        enable_ui = true,
      },
      which_key = true,
      indent_blankline = {
        enabled = true,
        colored_indent_levels = true,
      },
      dashboard = true,
      neogit = true,
      vim_sneak = false,
      fern = false,
      barbar = false,
      bufferline = true,
      markdown = true,
      lightspeed = false,
      ts_rainbow = true,
      hop = true,
      notify = true,
      telekasten = false,
      symbols_outline = true,
      mini = false,
      aerial = true,
      navic = true,
    },
  })
  vim.g.catppuccin_flavour = "mocha"
  vim.cmd([[colorscheme catppuccin]])
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

  -- vim.cmd "colorscheme material"
end

ui.navic = function()
  require("nvim-navic").setup({
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
    separator = "  ",
    depth_limit = 0,
    depth_limit_indicator = "..",
  })
  vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
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
      globalstatus = false,
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
  })
end

ui.indent_blankline = function()
  vim.opt.list = true
  -- vim.opt.listchars:append("space: ")
  -- vim.opt.listchars:append("eol:↴")

  require("indent_blankline").setup({
    char = "┊",
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = false,
    show_end_of_line = true,
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
end

ui.tree = function()
  -- each of these are documented in `:help nvim-tree.OPTION_NAME`
  require("nvim-tree").setup({
    -- BEGIN_DEFAULT_OPTS
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
      height = 30,
      side = "left",
      preserve_window_proportions = false,
      number = true,
      relativenumber = false,
      signcolumn = "yes",
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

ui.focus = function()
  require("focus").setup({
    excluded_filetypes = { "toggleterm", "dap-repl" },
  })
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
      border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
    },
  })
end

ui.lsp_status = function() end

return ui
