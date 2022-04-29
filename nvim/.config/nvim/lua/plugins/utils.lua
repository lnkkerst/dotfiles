local utils = {}

utils.sniprun = function()
    require "sniprun".setup(
        {
            selected_interpreters = {}, -- # use those instead of the default for the current filetype
            repl_enable = {}, -- # enable REPL-like behavior for the given interpreters
            repl_disable = {}, -- # disable REPL-like behavior for the given interpreters
            interpreter_options = {
                -- # intepreter-specific options, see docs / :SnipInfo <name>
                GFM_original = {
                    use_on_filetypes = { "markdown.pandoc" } -- # the 'use_on_filetypes' configuration key is
                    -- # available for every interpreter
                }
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
                notification_timeout = 5 -- # timeout for nvim_notify output
            },
            -- # You can use the same keys to customize whether a sniprun producing
            -- # no output should display nothing or '(no output)'
            show_no_output = {
                "Classic",
                "TempFloatingWindow" -- # implies LongTempFloatingWindow, which has no effect on its own
            },
            -- # customize highlight groups (setting this overrides colorscheme)
            snipruncolors = {
                SniprunVirtualTextOk = {
                    bg = "#66eeff",
                    fg = "#000000",
                    ctermbg = "Cyan",
                    cterfg = "Black"
                },
                SniprunFloatingWinOk = { fg = "#66eeff", ctermfg = "Cyan" },
                SniprunVirtualTextErr = {
                    bg = "#881515",
                    fg = "#000000",
                    ctermbg = "DarkRed",
                    cterfg = "Black"
                },
                SniprunFloatingWinErr = { fg = "#881515", ctermfg = "DarkRed" }
            },
            -- # miscellaneous compatibility/adjustement settings
            inline_messages = 0, -- # inline_message (0/1) is a one-line way to display messages
            -- # to workaround sniprun not being able to display anything

            borders = "single", -- # display borders around floating windows
            -- # possible values are 'none', 'single', 'double', or 'shadow'
            live_mode_toggle = "off" -- # live mode toggle, see Usage - Running for more info
        }
    )
end

utils.toggleterm = function()
    require("toggleterm").setup {
        -- open_mapping = [[<C-\>]],
        shade_terminals = false,
        -- start_in_insert = true,
        -- insert_mappings = true, -- whether or not the open mapping applies in insert mode
        -- terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
        float_opts = {
            border = "single"
        }
    }
end

utils.telescope = function()
    require('telescope').setup({})
end

utils.aerial = function()
    require("aerial").setup({
        backends = { "lsp" }
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
            scroll_down = '<c-d>', -- binding to scroll down inside the popup
            scroll_up = '<c-u>', -- binding to scroll up inside the popup
        },
        window = {
            border = "single", -- none, single, double, shadow
            position = "bottom", -- bottom, top
            margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
            padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
            winblend = 0
        },
        layout = {
            height = { min = 4, max = 25 }, -- min and max height of the columns
            width = { min = 20, max = 50 }, -- min and max width of the columns
            spacing = 3, -- spacing between columns
            align = "left", -- align columns left, center or right
        },
        ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
        hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
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
        }
    })
    require("telescope").load_extension("notify")
end

utils.jaq = function()
    require('jaq-nvim').setup {
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
                cpp = "g++ % -o $fileBase && ./$fileBase",
                c = "gcc % -o $fileBase && ./$fileBase",
                go = "go run %",
                sh = "sh %",
                java = "java %"
            },

            -- Uses internal commands such as 'source' and 'luafile'
            internal = {
                lua = "luafile %",
                vim = "source %"
            }
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
                width  = 0.8,
                x      = 0.5,
                y      = 0.5,

                -- Highlight group for floating window/border (see ':h winhl')
                border_hl = "FloatBorder",
                float_hl  = "Normal",

                -- Floating Window Transparency (see ':h winblend')
                blend = 0
            },

            terminal = {
                -- Position of terminal
                position = "bot",

                -- Open the terminal without line numbers
                line_no = false,

                -- Size of terminal
                size = 10
            },

            toggleterm = {
                -- Position of terminal, one of "vertical" | "horizontal" | "window" | "float"
                position = "float",

                -- Size of terminal
                size = 10
            },

            quickfix = {
                -- Position of quickfix window
                position = "bot",

                -- Size of quickfix window
                size = 10
            }
        }
    }
end

utils.gitsigns = function()
    require("gitsigns").setup({
        keymaps = {}
    })
end

utils.neogit = function()
    local neogit = require("neogit")
    neogit.setup()
end

utils.auto_session = function()
    require('auto-session').setup {
        log_level = 'info',
        auto_session_suppress_dirs = { '~/', '~/Projects' }
    }
end

utils.project = function()
    vim.g.nvim_tree_respect_buf_cwd = 1
    require("project_nvim").setup({})
end

return utils
