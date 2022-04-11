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
                            sidebars = true,
                            cursor_line = true
                        },
                        italics = {
                            comments = true,
                            functions = true
                        },
                        contrast_filetypes = {
                            "terminal",
                            "packer",
                            "qf"
                        },
                        disable = {
                            borders = true,
                            eob_lines = true
                        },
                        lualine_style = "stealth"
                    }
                )

                -- Enable the colorscheme
                vim.cmd "colorscheme material"
            end
        }
        use {
            "nvim-lualine/lualine.nvim",
            requires = {
                "kyazdani42/nvim-web-devicons",
                opt = true,
                config = function()
                    local gps = require("nvim-gps")
                    gps.setup({})

                    require("lualine").setup(
                        {
                            sections = {
                                lualine_c = {{gps.get_location, cond = gps.is_available}}
                            }
                        }
                    )
                end
            }
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
                require("telescope").setup({})
            end
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
                        max_file_lines = 1000 -- Do not enable for files with more than 1000 lines, int
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
                require "nvim-tree".setup {}
            end
        }
        use {
            "sbdchd/neoformat",
            config = function()
            end
        }
        if packer_bootstrap then
            require("packer").sync()
        end
    end
)
