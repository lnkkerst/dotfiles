local utils = {}

utils.sniprun = function()
  require("sniprun").setup({
    selected_interpreters = {}, -- # use those instead of the default for the current filetype
    repl_enable = {}, -- # enable REPL-like behavior for the given interpreters
    repl_disable = {}, -- # disable REPL-like behavior for the given interpreters
    interpreter_options = {
      -- # intepreter-specific options, see docs / :SnipInfo <name>
      GFM_original = {
        use_on_filetypes = { "markdown.pandoc" }, -- # the 'use_on_filetypes' configuration key is
        -- # available for every interpreter
      },
    },
    -- # you can combo different display modes as desired
    display = {
      "Classic", -- # display results in the command-line  area
      "VirtualTextOk", -- # display ok results as virtual text (multiline is shortened)

      -- "VirtualTextErr",          --# display error results as virtual text
      -- "TempFloatingWindow",      --# display results in a floating window
      -- "LongTempFloatingWindow",  --# same as above, but only long results. To use with VirtualText__
      -- "Terminal",                --# display results in a vertical split
      -- "TerminalWithCode",        --# display results and code history in a vertical split
      "NvimNotify", --# display with the nvim-notify plugin
      -- "Api"                      --# return output to a programming interface
    },
    display_options = {
      terminal_width = 45, -- # change the terminal display option width
      notification_timeout = 5, -- # timeout for nvim_notify output
    },
    -- # You can use the same keys to customize whether a sniprun producing
    -- # no output should display nothing or '(no output)'
    show_no_output = {
      "Classic",
      "TempFloatingWindow", -- # implies LongTempFloatingWindow, which has no effect on its own
    },
    -- # customize highlight groups (setting this overrides colorscheme)
    snipruncolors = {
      SniprunVirtualTextOk = {
        bg = "#66eeff",
        fg = "#000000",
        ctermbg = "Cyan",
        cterfg = "Black",
      },
      SniprunFloatingWinOk = { fg = "#66eeff", ctermfg = "Cyan" },
      SniprunVirtualTextErr = {
        bg = "#881515",
        fg = "#000000",
        ctermbg = "DarkRed",
        cterfg = "Black",
      },
      SniprunFloatingWinErr = { fg = "#881515", ctermfg = "DarkRed" },
    },
    -- # miscellaneous compatibility/adjustement settings
    inline_messages = 0, -- # inline_message (0/1) is a one-line way to display messages
    -- # to workaround sniprun not being able to display anything

    borders = "single", -- # display borders around floating windows
    -- # possible values are 'none', 'single', 'double', or 'shadow'
    live_mode_toggle = "off", -- # live mode toggle, see Usage - Running for more info
  })
end

utils.toggleterm = function()
  require("toggleterm").setup({
    -- open_mapping = [[<C-\>]],
    shade_terminals = false,
    -- start_in_insert = true,
    -- insert_mappings = true, -- whether or not the open mapping applies in insert mode
    -- terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
    float_opts = {
      border = "single",
    },
  })
end

utils.aerial = function()
  require("aerial").setup({
    backends = { "lsp" },
  })
end

utils.which_key = function()
  require("which-key").setup({
    plugins = {
      marks = true, -- shows a list of your marks on ' and `
      registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
      spelling = {
        enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
        suggestions = 20, -- how many suggestions should be shown in the list?
      },
      -- the presets plugin, adds help for a bunch of default keybindings in Neovim
      -- No actual key bindings are created
      presets = {
        operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
        motions = true, -- adds help for motions
        text_objects = true, -- help for text objects triggered after entering an operator
        windows = true, -- default bindings on <c-w>
        nav = true, -- misc bindings to work with windows
        z = true, -- bindings for folds, spelling and others prefixed with z
        g = true, -- bindings for prefixed with g
      },
    },
    -- add operators that will trigger motion and text object completion
    -- to enable all native operators, set the preset / operators plugin above
    operators = { gc = "Comments" },
    key_labels = {
      -- override the label used to display some keys. It doesn't effect WK in any other way.
      -- For example:
      -- ["<space>"] = "SPC",
      -- ["<cr>"] = "RET",
      -- ["<tab>"] = "TAB",
    },
    icons = {
      breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
      separator = "➜", -- symbol used between a key and it's label
      group = "+", -- symbol prepended to a group
    },
    popup_mappings = {
      scroll_down = "<c-d>", -- binding to scroll down inside the popup
      scroll_up = "<c-u>", -- binding to scroll up inside the popup
    },
    window = {
      border = "single", -- none, single, double, shadow
      position = "bottom", -- bottom, top
      margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
      padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
      winblend = 0,
    },
    layout = {
      height = { min = 4, max = 25 }, -- min and max height of the columns
      width = { min = 20, max = 50 }, -- min and max width of the columns
      spacing = 3, -- spacing between columns
      align = "left", -- align columns left, center or right
    },
    ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
    hidden = {
      "<silent>",
      "<cmd>",
      "<Cmd>",
      "<CR>",
      "call",
      "lua",
      "^:",
      "^ ",
    }, -- hide mapping boilerplate
    show_help = true, -- show help message on the command line when the popup is visible
    triggers = "auto", -- automatically setup triggers
    -- triggers = {"<leader>"} -- or specify a list manually
    triggers_blacklist = {
      -- list of mode / prefixes that should never be hooked by WhichKey
      -- this is mostly relevant for key maps that start with a native binding
      -- most people should not need to change this
      i = { "j", "k" },
      v = { "j", "k" },
    },
  })
end

utils.notify = function()
  local notify = require("notify")
  vim.notify = notify
  notify.setup({
    -- Minimum level to show
    level = "info",

    -- Animation style (see below for details)
    stages = "static",

    -- Function called when a new window is opened, use for changing win settings/config
    on_open = nil,

    -- Function called when a window is closed
    on_close = nil,

    -- Render function for notifications. See notify-render()
    render = "default",

    -- Default timeout for notifications
    timeout = 5000,

    -- Max number of columns for messages
    max_width = nil,
    -- Max number of lines for a message
    max_height = nil,

    -- For stages that change opacity this is treated as the highlight behind the window
    -- Set this to either a highlight group, an RGB hex value e.g. "#000000" or a function returning an RGB code for dynamic values
    background_colour = "Normal",

    -- Minimum width for notification windows
    minimum_width = 50,

    -- Icons for the different levels
    icons = {
      ERROR = "",
      WARN = "",
      INFO = "",
      DEBUG = "",
      TRACE = "✎",
    },
  })
  require("telescope").load_extension("notify")
end

utils.jaq = function()
  require("jaq-nvim").setup({
    -- Commands used with 'Jaq'
    cmds = {
      -- Default UI used (see `Usage` for options)
      default = "toggleterm",

      -- Uses external commands such as 'g++' and 'cargo'
      -- %: Current File
      -- $file: Current File
      -- $filePath: Path to Current File
      -- $fileBase: Basename of File(no extension)
      -- $altFile: Alternate File
      -- $dir: Current Working Directory(CWD)
      -- $moduleName: Python Module Name
      external = {
        typescript = "deno run %",
        javascript = "node %",
        markdown = "glow %",
        python = "python3 %",
        rust = "rustc % && ./$fileBase && rm $fileBase",
        cpp = "clang++ % -o $fileBase && ./$fileBase && rm $fileBase",
        c = "clang % -o $fileBase && ./$fileBase && rm $fileBase",
        go = "go run %",
        sh = "sh %",
        java = "java %",
      },

      -- Uses internal commands such as 'source' and 'luafile'
      internal = {
        lua = "luafile %",
        vim = "source %",
      },
    },

    -- UI settings
    ui = {
      -- Start in insert mode
      startinsert = true,

      -- Switch back to current file
      -- after using Jaq
      wincmd = false,

      -- Floating Window / FTerm settings
      float = {
        -- Floating window border (see ':h nvim_open_win')
        border = "single",

        -- Num from `0 - 1` for measurements
        height = 0.8,
        width = 0.8,
        x = 0.5,
        y = 0.5,

        -- Highlight group for floating window/border (see ':h winhl')
        border_hl = "FloatBorder",
        float_hl = "Normal",

        -- Floating Window Transparency (see ':h winblend')
        blend = 0,
      },

      terminal = {
        -- Position of terminal
        position = "bot",

        -- Open the terminal without line numbers
        line_no = false,

        -- Size of terminal
        size = 10,
      },

      toggleterm = {
        -- Position of terminal, one of "vertical" | "horizontal" | "window" | "float"
        position = "float",

        -- Size of terminal
        size = 10,
      },

      quickfix = {
        -- Position of quickfix window
        position = "bot",

        -- Size of quickfix window
        size = 10,
      },
    },
  })
end

utils.gitsigns = function()
  require("gitsigns").setup({
    keymaps = {},
  })
end

utils.neogit = function()
  local neogit = require("neogit")
  neogit.setup()
end

utils.session_manager = function()
  local Path = require("plenary.path")
  require("session_manager").setup({
    sessions_dir = Path:new(vim.fn.stdpath("data"), "sessions"), -- The directory where the session files will be saved.
    path_replacer = "__", -- The character to which the path separator will be replaced for session files.
    colon_replacer = "++", -- The character to which the colon symbol will be replaced for session files.
    autoload_mode = require("session_manager.config").AutoloadMode.Disabled, -- Define what to do when Neovim is started without arguments. Possible values: Disabled, CurrentDir, LastSession
    autosave_last_session = true, -- Automatically save last session on exit and on session switch.
    autosave_ignore_not_normal = true, -- Plugin will not save a session when no buffers are opened, or all of them aren't writable or listed.
    autosave_ignore_filetypes = { -- All buffers of these file types will be closed before the session is saved.
      "gitcommit",
    },
    autosave_only_in_session = true, -- Always autosaves session. If true, only autosaves after a session is active.
    max_path_length = 80, -- Shorten the display path if length exceeds this threshold. Use 0 if don't want to shorten the path at all.
  })
end

utils.project = function()
  require("project_nvim").setup({})
end

utils.bqf = function()
  require("bqf").setup({
    preview = {
      border_chars = {
        "│",
        "│",
        "─",
        "─",
        "┌",
        "┐",
        "└",
        "┘",
        "█",
      },
    },
  })
end

utils.litee = function()
  require("litee.lib").setup({})
  require("litee.calltree").setup({})
  require("litee.symboltree").setup({})
  require("litee.filetree").setup({})
  require("litee.bookmarks").setup({})
end

utils.filetype = function()
  require("filetype").setup({
    overrides = {
      literal = {
        ["tsconfig.json"] = "jsonc",
        ["jsconfig.json"] = "jsonc",
      },
    },
  })
end

utils.editorconfig = function() end

utils.code_runner = function()
  require("code_runner").setup({
    -- choose default mode (valid term, tab, float, toggle)
    mode = "term",
    -- Focus on runner window(only works on toggle, term and tab mode)
    focus = true,
    -- startinsert (see ':h inserting-ex')
    startinsert = false,
    term = {
      --  Position to open the terminal, this option is ignored if mode is tab
      position = "bot",
      -- window size, this option is ignored if tab is true
      size = 8,
    },
    float = {
      -- Window border (see ':h nvim_open_win')
      border = "none",

      -- Num from `0 - 1` for measurements
      height = 0.8,
      width = 0.8,
      x = 0.5,
      y = 0.5,

      -- Highlight group for floating window/border (see ':h winhl')
      border_hl = "FloatBorder",
      float_hl = "Normal",

      -- Transparency (see ':h winblend')
      blend = 0,
    },
    filetype_path = vim.fn.stdpath("data")
      .. "/site/pack/packer/start/code_runner.nvim/lua/code_runner/code_runner.json",
    filetype = {
      cpp = "cd $dir && clang++ $fileName && $dir/$fileNameWithoutExt",
    },
    project_path = vim.fn.stdpath("data")
      .. "/site/pack/packer/start/code_runner.nvim/lua/code_runner/project_manager.json",
    project = {},
  })
end

utils.fcitx_ui = function()
  local consts = require("fcitx5-ui.consts")

  local default_cfg = {
    keys = {
      trigger = {
        "<A-I>",
        consts.FcitxKey.space,
        5,
      },
      up = { "<Up>", consts.FcitxKey.up, consts.FcitxKeyState.no },
      down = { "<Down>", consts.FcitxKey.down, consts.FcitxKeyState.no },
      left = { "<Left>", consts.FcitxKey.left, consts.FcitxKeyState.no },
      right = { "<Right>", consts.FcitxKey.right, consts.FcitxKeyState.no },
      enter = { "<CR>", consts.FcitxKey.enter, consts.FcitxKeyState.no },
      backspace = {
        "<BS>",
        0xff08,
        consts.FcitxKeyState.no,
      },
      tab = { "<Tab>", consts.FcitxKey.tab, consts.FcitxKeyState.no },
      stab = { "<S-Tab>", consts.FcitxKey.tab, consts.FcitxKeyState.shift },
    },
    ignore_module_missing_warning = false,
    prev = "<|",
    next = "|>",
    update = 50,
  }

  require("fcitx5-ui").setup(default_cfg)
  local cfg = require("lualine").get_config()
  table.insert(cfg.sections.lualine_y, 'require("fcitx5-ui").getCurrentIM()')
  require("lualine").setup(cfg)
end

utils.nvimux = function()
  local nvimux = require("nvimux")
  nvimux.setup({
    config = {
      prefix = "<C-a>",
    },
    bindings = {
      { { "n", "v", "i", "t" }, "s", nvimux.commands.horizontal_split },
      { { "n", "v", "i", "t" }, "v", nvimux.commands.vertical_split },
    },
  })
end

utils.tmux = function()
  require("tmux").setup({
    -- overwrite default configuration
    -- here, e.g. to enable default bindings
    copy_sync = {
      -- enables copy sync and overwrites all register actions to
      -- sync registers *, +, unnamed, and 0 till 9 from tmux in advance
      enable = false,
    },
    navigation = {
      -- enables default keybindings (C-hjkl) for normal mode
      enable_default_keybindings = false,
    },
    resize = {
      -- enables default keybindings (A-hjkl) for normal mode
      enable_default_keybindings = false,
    },
  })
end

utils.neotest = function()
  require("neotest").setup({
    adapters = {
      require("neotest-jest"),
    },
    diagnostic = {
      enabled = true,
    },
    floating = {
      max_height = 0.6,
      max_width = 0.6,
    },
    highlights = {
      adapter_name = "NeotestAdapterName",
      border = "NeotestBorder",
      dir = "NeotestDir",
      expand_marker = "NeotestExpandMarker",
      failed = "NeotestFailed",
      file = "NeotestFile",
      focused = "NeotestFocused",
      indent = "NeotestIndent",
      namespace = "NeotestNamespace",
      passed = "NeotestPassed",
      running = "NeotestRunning",
      skipped = "NeotestSkipped",
      test = "NeotestTest",
    },
    icons = {
      child_indent = "│",
      child_prefix = "├",
      collapsed = "─",
      expanded = "╮",
      failed = "✖",
      final_child_indent = " ",
      final_child_prefix = "╰",
      non_collapsible = "─",
      passed = "✔",
      running = "",
      skipped = "ﰸ",
      unknown = "?",
    },
    output = {
      enabled = true,
      open_on_run = true,
    },
    run = {
      enabled = true,
    },
    status = {
      enabled = true,
    },
    strategies = {
      integrated = {
        height = 40,
        width = 120,
      },
    },
    summary = {
      enabled = true,
      expand_errors = true,
      follow = true,
      mappings = {
        attach = "a",
        expand = { "<CR>", "<2-LeftMouse>" },
        expand_all = "e",
        jumpto = "i",
        output = "o",
        run = "r",
        short = "O",
        stop = "u",
      },
    },
  })
end

utils.zen = function()
  require("zen-mode").setup({})
end

return utils
