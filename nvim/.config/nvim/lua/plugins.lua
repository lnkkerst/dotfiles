local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap =
        fn.system(
        {
            "git",
            "clone",
            "--depth",
            "1",
            "https://github.com/wbthomason/packer.nvim",
            install_path
        }
    )
end

return require("packer").startup(
    function(use)
        use {
            "wbthomason/packer.nvim",
            config = function()
            end
        }
        use {
            "neoclide/coc.nvim",
            branch = "release",
            config = function()
                vim.api.nvim_exec([[source ~/.config/nvim/coc_config.vim]], false)
            end
        }
        use {
            "marko-cerovac/material.nvim",
            config = function()
                -- Set the theme style
                vim.g.material_style = "darker"

                require("material").setup(
                    {
                        contrast = {
                            sidebars = false, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
                            floating_windows = true, -- Enable contrast for floating windows
                            line_numbers = false, -- Enable contrast background for line numbers
                            sign_column = false, -- Enable contrast background for the sign column
                            cursor_line = false, -- Enable darker background for the cursor line
                            non_current_windows = false, -- Enable darker background for non-current windows
                            popup_menu = true -- Enable lighter background for the popup menu
                        },
                        italics = {
                            comments = false, -- Enable italic comments
                            keywords = false, -- Enable italic keywords
                            functions = false, -- Enable italic functions
                            strings = false, -- Enable italic strings
                            variables = false -- Enable italic variables
                        },
                        contrast_filetypes = {
                            -- Specify which filetypes get the contrasted (darker) background
                            "terminal", -- Darker terminal background
                            "packer", -- Darker packer background
                            "qf" -- Darker qf list background
                        },
                        high_visibility = {
                            lighter = false, -- Enable higher contrast text for lighter style
                            darker = false -- Enable higher contrast text for darker style
                        },
                        disable = {
                            borders = false, -- Disable borders between verticaly split windows
                            background = false, -- Prevent the theme from setting the background (NeoVim then uses your teminal background)
                            term_colors = false, -- Prevent the theme from setting terminal colors
                            eob_lines = false -- Hide the end-of-buffer lines
                        },
                        lualine_style = "default", -- Lualine style ( can be 'stealth' or 'default' )
                        async_loading = true, -- Load parts of the theme asyncronously for faster startup (turned on by default)
                        custom_highlights = {} -- Overwrite highlights with your own}
                    }
                )

                -- Enable the colorscheme
                vim.cmd "colorscheme material"
            end
        }
        use {
            "nvim-lualine/lualine.nvim",
            requires = {
                "kyazdani42/nvim-web-devicons"
            },
            config = function()
                local gps = require("nvim-gps")
                gps.setup({})

                require("lualine").setup(
                    {
                        sections = {
                            lualine_c = {{gps.get_location, cond = gps.is_available}}
                        },
                        extensions = {"nvim-tree"}
                    }
                )
            end
        }
        use {
            "glepnir/dashboard-nvim",
            config = function()
                vim.g.dashboard_default_executive = "telescope"
            end
        }
        use {
            "akinsho/bufferline.nvim",
            tag = "*",
            requires = "kyazdani42/nvim-web-devicons",
            config = function()
                require("bufferline").setup({})
            end
        }
        use {
            "liuchengxu/vim-which-key",
            config = function()
            end
        }
        use {
            "nvim-telescope/telescope.nvim",
            requires = {{"nvim-lua/plenary.nvim"}},
            config = function()
                require("telescope").load_extension("media_files")
                require("telescope").setup({})
            end
        }
        use {
            "nvim-telescope/telescope-media-files.nvim",
            requires = {
                "nvim-telescope/telescope.nvim",
                "nvim-lua/popup.nvim",
                "nvim-lua/plenary.nvim"
            }
        }
        use {
            "lukas-reineke/indent-blankline.nvim",
            config = function()
                require("indent_blankline").setup {
                    char = "|",
                    show_first_indent_level = true,
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
                    buftype_exclude = {"terminal", "nofile"},
                    context_patterns = {
                        "class",
                        "function",
                        "method",
                        "block",
                        "list_literal",
                        "selector",
                        "^if",
                        "^table",
                        "if_statement",
                        "while",
                        "for",
                        "type",
                        "var",
                        "import"
                    }
                }
            end
        }
        use {
            "nvim-treesitter/nvim-treesitter",
            run = ":TSUpdate",
            config = function()
                vim.g.foldmethod = "expr"
                vim.g.foldexpr = "nvim_treesitter#foldexpr()"
                require "nvim-treesitter.configs".setup {
                    highlight = {enable = true, disable = {"vim"}},
                    textobjects = {
                        select = {
                            enable = true,
                            keymaps = {
                                ["af"] = "@function.outer",
                                ["if"] = "@function.inner",
                                ["ac"] = "@class.outer",
                                ["ic"] = "@class.inner"
                            }
                        },
                        move = {
                            enable = true,
                            set_jumps = true, -- whether to set jumps in the jumplist
                            goto_next_start = {
                                ["]["] = "@function.outer",
                                ["]m"] = "@class.outer"
                            },
                            goto_next_end = {
                                ["]]"] = "@function.outer",
                                ["]M"] = "@class.outer"
                            },
                            goto_previous_start = {
                                ["[["] = "@function.outer",
                                ["[m"] = "@class.outer"
                            },
                            goto_previous_end = {
                                ["[]"] = "@function.outer",
                                ["[M"] = "@class.outer"
                            }
                        }
                    },
                    rainbow = {
                        enable = true,
                        extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
                        max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
                        colors = {
                            "#90CAF9",
                            "#9575CD",
                            "#26A69A",
                            "#EEFF41",
                            "#BDBDBD",
                            "#FF8A65",
                            "#FF5252"
                        }
                    },
                    context_commentstring = {enable = true, enable_autocmd = false},
                    matchup = {enable = true},
                    context = {enable = true, throttle = true}
                }
            end
        }
        use {
            "SmiteshP/nvim-gps",
            requires = "nvim-treesitter/nvim-treesitter"
        }
        use {
            "kyazdani42/nvim-tree.lua",
            requires = {
                "kyazdani42/nvim-web-devicons" -- optional, for file icon
            },
            config = function()
                local tree_cb = require "nvim-tree.config".nvim_tree_callback
                require("nvim-tree").setup {
                    gitignore = true,
                    ignore = {".git", "node_modules", ".cache"},
                    open_on_tab = false,
                    disable_netrw = true,
                    hijack_netrw = true,
                    update_cwd = true,
                    highlight_opened_files = true,
                    auto_ignore_ft = {"startify", "dashboard"},
                    update_focused_file = {
                        enable = true,
                        update_cwd = true,
                        ignore_list = {}
                    },
                    view = {
                        width = 30,
                        side = "left",
                        auto_resize = false,
                        mappings = {
                            custom_only = true,
                            -- list of mappings to set on the tree manually
                            list = {
                                {
                                    key = {"<CR>", "o", "<2-LeftMouse>"},
                                    cb = tree_cb("tabnew")
                                },
                                {key = {"<2-RightMouse>", "<C-]>"}, cb = tree_cb("cd")},
                                {key = "<C-v>", cb = tree_cb("vsplit")},
                                {key = "<C-x>", cb = tree_cb("split")},
                                {key = "<C-t>", cb = tree_cb("tabnew")},
                                {key = "<", cb = tree_cb("prev_sibling")},
                                {key = ">", cb = tree_cb("next_sibling")},
                                {key = "P", cb = tree_cb("parent_node")},
                                {key = "<BS>", cb = tree_cb("close_node")},
                                {key = "<S-CR>", cb = tree_cb("close_node")},
                                {key = "<Tab>", cb = tree_cb("preview")},
                                {key = "K", cb = tree_cb("first_sibling")},
                                {key = "J", cb = tree_cb("last_sibling")},
                                {key = "I", cb = tree_cb("toggle_ignored")},
                                {key = "H", cb = tree_cb("toggle_dotfiles")},
                                {key = "R", cb = tree_cb("refresh")},
                                {key = "a", cb = tree_cb("create")},
                                {key = "d", cb = tree_cb("remove")},
                                {key = "r", cb = tree_cb("rename")},
                                {key = "<C-r>", cb = tree_cb("full_rename")},
                                {key = "x", cb = tree_cb("cut")},
                                {key = "c", cb = tree_cb("copy")},
                                {key = "p", cb = tree_cb("paste")},
                                {key = "y", cb = tree_cb("copy_name")},
                                {key = "Y", cb = tree_cb("copy_path")},
                                {key = "gy", cb = tree_cb("copy_absolute_path")},
                                {key = "[c", cb = tree_cb("prev_git_item")},
                                {key = "]c", cb = tree_cb("next_git_item")},
                                {key = "-", cb = tree_cb("dir_up")},
                                {key = "s", cb = tree_cb("system_open")},
                                {key = "q", cb = tree_cb("close")},
                                {key = "g?", cb = tree_cb("toggle_help")}
                            }
                        }
                    }
                }
            end
        }
        use {
            "nvim-treesitter/nvim-treesitter-textobjects",
            config = function()
            end
        }
        use {
            "romgrk/nvim-treesitter-context",
            config = function()
            end
        }
        use {
            "p00f/nvim-ts-rainbow",
            config = function()
            end
        }
        use {
            "sbdchd/neoformat",
            config = function()
            end
        }
        use {
            "windwp/nvim-ts-autotag",
            config = function()
                require("nvim-ts-autotag").setup(
                    {
                        filetypes = {
                            "html",
                            "xml",
                            "javascript",
                            "typescriptreact",
                            "javascriptreact",
                            "vue"
                        }
                    }
                )
            end
        }
        use {
            "andymass/vim-matchup",
            config = function()
                vim.cmd [[let g:matchup_matchparen_offscreen = {'method': 'popup'}]]
            end
        }
        use {
            "rhysd/accelerated-jk",
            config = function()
            end
        }
        use {
            "lewis6991/gitsigns.nvim",
            -- tag = 'release' -- To use the latest release
            config = function()
                require("gitsigns").setup({})
            end
        }
        use {
            "justinmk/vim-sneak",
            config = function()
            end
        }
        use {
            "junegunn/vim-easy-align",
            config = function()
                vim.api.nvim_command("augroup user_plugin_cursorword")
                vim.api.nvim_command("autocmd!")
                vim.api.nvim_command("autocmd FileType NvimTree,lspsagafinder,dashboard let b:cursorword = 0")
                vim.api.nvim_command("autocmd WinEnter * if &diff || &pvw | let b:cursorword = 0 | endif")
                vim.api.nvim_command("autocmd InsertEnter * let b:cursorword = 0")
                vim.api.nvim_command("autocmd InsertLeave * let b:cursorword = 1")
                vim.api.nvim_command("augroup END")
            end
        }
        use {
            "itchyny/vim-cursorword",
            config = function()
            end
        }
        use {
            "thinca/vim-quickrun",
            config = function()
            end
        }
        use {
            "gelguy/wilder.nvim",
            requires = {"romgrk/fzy-lua-native"},
            config = function()
                vim.cmd [[
call wilder#setup({'modes': [':', '/', '?']})
call wilder#set_option('use_python_remote_plugin', 0)

call wilder#set_option('pipeline', [wilder#branch(wilder#cmdline_pipeline({'use_python': 0,'fuzzy': 1, 'fuzzy_filter': wilder#lua_fzy_filter()}),wilder#vim_search_pipeline(), [wilder#check({_, x -> empty(x)}), wilder#history(), wilder#result({'draw': [{_, x -> ' ' . x}]})])])

call wilder#set_option('renderer', wilder#renderer_mux({':': wilder#popupmenu_renderer({'highlighter': wilder#lua_fzy_highlighter(), 'left': [wilder#popupmenu_devicons()], 'right': [' ', wilder#popupmenu_scrollbar()]}), '/': wilder#wildmenu_renderer({'highlighter': wilder#lua_fzy_highlighter()})}))
]]
            end
        }
        use {
            "nathom/filetype.nvim"
        }
        use {
            "iamcco/markdown-preview.nvim",
            run = "cd app && yarn install"
        }
        use {
            "tpope/vim-fugitive",
            config = function()
            end
        }
        if packer_bootstrap then
            require("packer").sync()
        end
    end
)
