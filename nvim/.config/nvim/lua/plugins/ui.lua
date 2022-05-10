local ui = {}

ui.dashboard = function()
    vim.g.dashboard_default_executive = "telescope"
    vim.g.dashboard_custom_header = {
        [[                    .       .       ]],
        [[          .                         ]],
        [[       ,,/..,.   .       ..         ]],
        [[      .. *(/*,         .... .       ]],
        [[         .. .,,...,  ,.,*.,, .      ]],
        [[            ......//(,,,*.          ]],
        [[            ,,,.*(%#,*,.            ]],
        [[         ..,.,/**/,,, ..            ]],
        [[       , ..*//*(#*,(*(*   .         ]],
        [[     . .,/,,..(,*(/*/* *(*,.        ]],
        [[      ..   **#*/*%*.(*.*, .       . ]],
        [[       ...**,/*#%/#((/*///, . ..   .]],
        [[..  ..,(/((/**(#(((/*((((//(/......,]],
        [[(,./(/(/*/(*/(/(###(/(/,*/(/**/**///]],
        [[,,,,*.,.,**...*.*....**//(*(/,,,,...]]
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
    require("catppuccin").setup(
        {
            transparent_background = false,
            term_colors = true,
            styles = {
                comments = "italic",
                functions = "italic",
                keywords = "italic",
                strings = "NONE",
                variables = "NONE"
            },
            integrations = {
                treesitter = true,
                native_lsp = {
                    enabled = true,
                    virtual_text = {
                        errors = "italic",
                        hints = "italic",
                        warnings = "italic",
                        information = "italic"
                    },
                    underlines = {
                        errors = "underline",
                        hints = "underline",
                        warnings = "underline",
                        information = "underline"
                    }
                },
                lsp_trouble = true,
                cmp = true,
                lsp_saga = true,
                gitgutter = false,
                gitsigns = true,
                telescope = true,
                nvimtree = {
                    enabled = true,
                    show_root = false,
                    transparent_panel = false
                },
                neotree = {
                    enabled = false,
                    show_root = false,
                    transparent_panel = false
                },
                which_key = false,
                indent_blankline = {
                    enabled = true,
                    colored_indent_levels = true
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
                telekasten = true,
                symbols_outline = true
            }
        }
    )
    vim.cmd [[colorscheme catppuccin]]
end

ui.material = function()
    vim.g.material_style = "deep ocean"
    require("material").setup(
        {
            contrast = {
                sidebars = false, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
                floating_windows = false, -- Enable contrast for floating windows
                line_numbers = false, -- Enable contrast background for line numbers
                sign_column = false, -- Enable contrast background for the sign column
                cursor_line = false, -- Enable darker background for the cursor line
                non_current_windows = false, -- Enable darker background for non-current windows
                popup_menu = false -- Enable lighter background for the popup menu
            },
            italics = {
                comments = true, -- Enable italic comments
                keywords = true, -- Enable italic keywords
                functions = true, -- Enable italic functions
                strings = false, -- Enable italic strings
                variables = false -- Enable italic variables
            },
            contrast_filetypes = {},
            high_visibility = {
                lighter = true, -- Enable higher contrast text for lighter style
                darker = true -- Enable higher contrast text for darker style
            },
            disable = {
                borders = false, -- Disable borders between verticaly split windows
                background = false, -- Prevent the theme from setting the background (NeoVim then uses your teminal background)
                term_colors = false, -- Prevent the theme from setting terminal colors
                eob_lines = false -- Hide the end-of-buffer lines
            },
            lualine_style = "stealth", -- Lualine style ( can be 'stealth' or 'default' )
            async_loading = true, -- Load parts of the theme asyncronously for faster startup (turned on by default)
            custom_highlights = {} -- Overwrite highlights with your own
        }
    )

    -- vim.cmd "colorscheme material"
end

ui.gps = function()
    require("nvim-gps").setup(
        {
            disable_icons = false, -- Setting it to true will disable all icons
            icons = {
                ["class-name"] = " ", -- Classes and class-like objects
                ["function-name"] = " ", -- Functions
                ["method-name"] = " ", -- Methods (functions inside class-like objects)
                ["container-name"] = "⛶ ", -- Containers (example: lua tables)
                ["tag-name"] = "炙" -- Tags (example: html tags)
            },
            -- Add custom configuration per language or
            -- Disable the plugin for a language
            -- Any language not disabled here is enabled by default
            languages = {
                -- Some languages have custom icons
                ["json"] = {
                    icons = {
                        ["array-name"] = " ",
                        ["object-name"] = " ",
                        ["null-name"] = "[] ",
                        ["boolean-name"] = "ﰰﰴ ",
                        ["number-name"] = "# ",
                        ["string-name"] = " "
                    }
                },
                ["latex"] = {
                    icons = { ["title-name"] = "# ", ["label-name"] = " " }
                },
                ["norg"] = { icons = { ["title-name"] = " " } },
                ["toml"] = {
                    icons = {
                        ["table-name"] = " ",
                        ["array-name"] = " ",
                        ["boolean-name"] = "ﰰﰴ ",
                        ["date-name"] = " ",
                        ["date-time-name"] = " ",
                        ["float-name"] = " ",
                        ["inline-table-name"] = " ",
                        ["integer-name"] = "# ",
                        ["string-name"] = " ",
                        ["time-name"] = " "
                    }
                },
                ["verilog"] = { icons = { ["module-name"] = " " } },
                ["yaml"] = {
                    icons = {
                        ["mapping-name"] = " ",
                        ["sequence-name"] = " ",
                        ["null-name"] = "[] ",
                        ["boolean-name"] = "ﰰﰴ ",
                        ["integer-name"] = "# ",
                        ["float-name"] = " ",
                        ["string-name"] = " "
                    }
                },
                ["yang"] = {
                    icons = {
                        ["module-name"] = " ",
                        ["augment-path"] = " ",
                        ["container-name"] = " ",
                        ["grouping-name"] = " ",
                        ["typedef-name"] = " ",
                        ["identity-name"] = " ",
                        ["list-name"] = "﬘ ",
                        ["leaf-list-name"] = " ",
                        ["leaf-name"] = " ",
                        ["action-name"] = " "
                    }
                }

                -- Disable for particular languages
                -- ["bash"] = false, -- disables nvim-gps for bash
                -- ["go"] = false,   -- disables nvim-gps for golang

                -- Override default setting for particular languages
                -- ["ruby"] = {
                --	separator = '|', -- Overrides default separator with '|'
                --	icons = {
                --		-- Default icons not specified in the lang config
                --		-- will fallback to the default value
                --		-- "container-name" will fallback to default because it's not set
                --		["function-name"] = '',    -- to ensure empty values, set an empty string
                --		["tag-name"] = ''
                --		["class-name"] = '::',
                --		["method-name"] = '#',
                --	}
                -- }
            },
            separator = "  ",
            -- limit for amount of context shown
            -- 0 means no limit
            depth = 0,
            -- indicator used when context hits depth limit
            depth_limit_indicator = ".."
        }
    )
end

ui.lualine = function()
    local gps = require("nvim-gps")
    local mini_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { "location" }
    }
    local simple_sections = {
        lualine_a = { "mode" },
        lualine_b = { "filetype" },
        lualine_c = {},
        lualine_x = {},
        lualine_z = { "location" }
    }
    require("lualine").setup {
        options = {
            icons_enabled = true,
            theme = "auto",
            component_separators = { left = "", right = "" },
            -- component_separators = { left = "|", right = "|" },
            section_separators = { left = "", right = "" },
            -- section_separators = { left = "", right = "" },
            disabled_filetypes = {},
            always_divide_middle = true,
            globalstatus = false
        },
        sections = {
            lualine_a = { "mode" },
            lualine_b = { "branch", "diff" },
            lualine_c = { { gps.get_location, cond = gps.is_available } },
            lualine_x = { { "diagnostics" } },
            lualine_y = { { "filetype" }, { "encoding" }, { "fileformat" } },
            lualine_z = { "progress", "location" }
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = { "filename" },
            lualine_x = { "location" },
            lualine_y = {},
            lualine_z = {}
        },
        tabline = {},
        extensions = {
            "nvim-tree",
            "toggleterm",
            {
                sections = mini_sections,
                filetypes = { "aerial" }
            },
            {
                sections = simple_sections,
                filetypes = {
                    "dapui_scopes",
                    "dapui_breakponts",
                    "dapui_stacks",
                    "dapui_watches"
                }
            }
        }
    }
end

ui.bufferline = function()
    require("bufferline").setup {
        options = {
            mod = "buffers",
            numbers = "ordinal",
            diagnostics = "nvim_lsp",
            offsets = {
                {
                    filetype = "NvimTree",
                    text = "File Explorer",
                    text_align = "center",
                    padding = 1
                }
            }
        }
    }
end

ui.indent_blankline = function()
    vim.opt.list = true
    vim.opt.listchars:append("space:⋅")
    vim.opt.listchars:append("eol:↴")

    require("indent_blankline").setup {
        char = "│",
        space_char_blankline = " ",
        show_current_context = true,
        show_current_context_start = true,
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
            "json",
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
            ""
        },
        buftype_exclude = { "terminal", "nofile" }
    }
end

ui.tree = function()
    vim.g.nvim_tree_respect_buf_cwd = 1
    -- each of these are documented in `:help nvim-tree.OPTION_NAME`
    require("nvim-tree").setup {
        -- BEGIN_DEFAULT_OPTS
        auto_reload_on_write = true,
        disable_netrw = true,
        hijack_cursor = false,
        hijack_netrw = true,
        hijack_unnamed_buffer_when_opening = false,
        ignore_buffer_on_setup = false,
        open_on_setup = false,
        open_on_setup_file = false,
        open_on_tab = false,
        sort_by = "name",
        update_cwd = true,
        view = {
            width = 30,
            height = 30,
            side = "left",
            preserve_window_proportions = false,
            number = true,
            relativenumber = false,
            signcolumn = "yes",
            mappings = {
                custom_only = false,
                list = {}
            }
        },
        renderer = {
            indent_markers = {
                enable = false,
                icons = { corner = "└ ", edge = "│ ", none = "  " }
            },
        },
        hijack_directories = { enable = true, auto_open = true },
        update_focused_file = {
            enable = true,
            update_cwd = true,
            ignore_list = {}
        },
        ignore_ft_on_setup = {},
        system_open = { cmd = nil, args = {} },
        diagnostics = {
            enable = true,
            show_on_dirs = true,
            icons = { hint = "", info = "", warning = "", error = "" }
        },
        filters = { dotfiles = false, custom = {}, exclude = {} },
        git = {
            enable = true,
            ignore = true,
            timeout = 400
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
                            "fugitiveblame"
                        },
                        buftype = { "nofile", "terminal", "help" }
                    }
                }
            }
        },
        trash = { cmd = "trash", require_confirm = true },
        log = {
            enable = false,
            truncate = false,
            types = {
                all = false,
                config = false,
                copy_paste = false,
                git = false,
                profile = false
            }
        }
    }
end

ui.transparent = function()
    require("transparent").setup(
        {
            enable = false, -- boolean: enable transparent
            extra_groups = {},
            exclude = {} -- table: groups you don't want to clear
        }
    )
end

ui.scrollbar = function()
    require("scrollbar").setup()
    require("scrollbar.handlers.search").setup()
end

ui.focus = function()
    require("focus").setup({
        excluded_filetypes = { "toggleterm", [[dap-repl]] }
    })
end


ui.trouble = function()
    require("trouble").setup {}
end

ui.sidebar = function()
    require("sidebar-nvim").setup({
        open = false
    })
end

return ui
