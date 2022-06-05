local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system(
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
    {
        function(use)
            use { "lewis6991/impatient.nvim" }
            use { "wbthomason/packer.nvim" }

            local ui = require("plugins.ui")
            use { "catppuccin/nvim", as = "catppuccin", config = ui.catppuccin }
            use { "folke/tokyonight.nvim", config = ui.tokyonight }
            use { "sainnhe/gruvbox-material", config = ui.gruvbox_material }
            use { "marko-cerovac/material.nvim", config = ui.material }
            use { "tomasiser/vim-code-dark" }
            use { "shaunsingh/nord.nvim", config = ui.nord }
            use {
                "nvim-lualine/lualine.nvim",
                requires = { "kyazdani42/nvim-web-devicons", opt = true },
                config = ui.lualine
            }
            use {
                "SmiteshP/nvim-gps",
                requires = "nvim-treesitter/nvim-treesitter",
                config = ui.gps
            }
            use {
                "akinsho/bufferline.nvim",
                requires = "kyazdani42/nvim-web-devicons",
                config = ui.bufferline
            }
            use { "lukas-reineke/indent-blankline.nvim", config = ui.indent_blankline }
            use {
                "glepnir/dashboard-nvim",
                requires = { "nvim-telescope/telescope.nvim" },
                config = ui.dashboard
            }
            use {
                "kyazdani42/nvim-tree.lua",
                requires = {
                    "kyazdani42/nvim-web-devicons" -- optional, for file icon
                },
                config = ui.tree
            }
            use { "xiyaowong/nvim-transparent", config = ui.transparent }
            use { "petertriho/nvim-scrollbar", config = ui.scrollbar }
            use { "beauwilliams/focus.nvim", config = ui.focus }
            use {
                "folke/trouble.nvim",
                requires = "kyazdani42/nvim-web-devicons",
                config = ui.trouble
            }
            use { "sidebar-nvim/sidebar.nvim", config = ui.sidebar }

            local editor = require("plugins.editor")
            use { "rhysd/accelerated-jk" }
            use { "xiyaowong/nvim-cursorword", config = editor.cursorword }
            use { "windwp/nvim-autopairs", config = editor.autopairs }
            use { "numToStr/Comment.nvim", config = editor.comment }
            use { "phaazon/hop.nvim", branch = "v1", config = editor.hop }
            use { "kevinhwang91/nvim-hlslens", config = editor.hlslens }
            -- use { "karb94/neoscroll.nvim", config = editor.neoscroll }
            -- use {"haringsrob/nvim_context_vt", config = editor.context_vt}
            -- use { "edluffy/specs.nvim", config = editor.specs }
            use { "Pocco81/AutoSave.nvim", config = editor.autosave }
            use { "mizlan/iswap.nvim", config = editor.iswap }
            use { "ethanholz/nvim-lastplace", config = editor.lastplace }
            use { "nacro90/numb.nvim", config = editor.numb }
            -- use {
            --     "anuvyklack/pretty-fold.nvim",
            --     requires = { "anuvyklack/nvim-keymap-amend" },
            --     config = editor.pretty_fold
            -- }
            use {
                "danymat/neogen",
                requires = { "nvim-treesitter/nvim-treesitter" },
                config = editor.neogen
            }
            -- use { "abecodes/tabout.nvim", config = editor.tabout }
            -- use { "max397574/better-escape.nvim", config = editor.better_escape }

            local lsp = require("plugins.lsp")
            use { "neovim/nvim-lspconfig", config = lsp.lspconfig }
            use { "tami5/lspsaga.nvim", config = lsp.lspsaga }
            use { "williamboman/nvim-lsp-installer", config = lsp.lsp_installer }
            use { "j-hui/fidget.nvim", config = lsp.fidget }
            use { "folke/lsp-colors.nvim", config = lsp.lsp_colors }
            use { "lukas-reineke/lsp-format.nvim", config = lsp.format }
            use { "b0o/schemastore.nvim" }
            use { "simrat39/symbols-outline.nvim", config = lsp.symbols_outline }
            use { "jubnzv/virtual-types.nvim", config = lsp.virtual_types }

            local cmp = require("plugins.cmp")
            use { "hrsh7th/nvim-cmp", config = cmp.cmp }
            use { "hrsh7th/cmp-nvim-lsp" }
            use { "hrsh7th/cmp-buffer" }
            use { "hrsh7th/cmp-path" }
            use { "hrsh7th/cmp-cmdline" }
            use { "f3fora/cmp-spell" }
            use { "lukas-reineke/cmp-under-comparator" }
            use { "hrsh7th/cmp-nvim-lsp-document-symbol" }
            use { "hrsh7th/cmp-nvim-lsp-signature-help" }
            use { "mtoohey31/cmp-fish" }
            use { "andersevenrud/cmp-tmux" }
            use {
                "David-Kunz/cmp-npm",
                requires = {
                    "nvim-lua/plenary.nvim"
                }
            }
            use { "onsails/lspkind.nvim" }
            use {
                "saadparwaiz1/cmp_luasnip",
                requires = {
                    { "L3MON4D3/LuaSnip", config = cmp.luasnip },
                    { "rafamadriz/friendly-snippets" }
                }
            }
            use { "ray-x/cmp-treesitter" }
            use { "hrsh7th/cmp-nvim-lua" }
            use { "hrsh7th/cmp-calc" }
            use { "hrsh7th/cmp-omni" }
            use { "hrsh7th/cmp-emoji" }
            use {
                "tzachar/cmp-tabnine",
                run = "./install.sh",
                requires = "hrsh7th/nvim-cmp",
                config = cmp.tabnine
            }

            local fzf = require("plugins.fzf")
            use {
                "nvim-telescope/telescope.nvim",
                requires = { { "nvim-lua/plenary.nvim" } },
                config = fzf.telescope
            }
            use {
                "nvim-telescope/telescope-fzy-native.nvim",
                run = "make",
                config = ui.telescope_fzf_native
            }
            use {
                "AckslD/nvim-neoclip.lua",
                requires = { "tami5/sqlite.lua", module = "sqlite" },
                config = fzf.neoclip
            }
            use { "nvim-telescope/telescope-file-browser.nvim", config = fzf.file_browser }
            use { "nvim-telescope/telescope-packer.nvim", config = fzf.packer }
            use { "nvim-telescope/telescope-symbols.nvim", config = fzf.symbols }
            use { "nvim-telescope/telescope-github.nvim", config = fzf.github }
            use {
                "nvim-telescope/telescope-frecency.nvim",
                requires = { "tami5/sqlite.lua" },
                config = fzf.frecency
            }

            local ts = require("plugins.ts")
            use {
                "nvim-treesitter/nvim-treesitter",
                run = ":TSUpdate",
                config = ts.treesitter
            }
            use {
                "nvim-treesitter/nvim-treesitter-textobjects",
                requires = { "nvim-treesitter/nvim-treesitter" }
            }
            use {
                "windwp/nvim-ts-autotag",
                requires = { "nvim-treesitter/nvim-treesitter" },
                config = ts.autotag
            }
            use {
                "p00f/nvim-ts-rainbow",
                requires = { "nvim-treesitter/nvim-treesitter" }
            }
            use {
                "JoosepAlviste/nvim-ts-context-commentstring",
                requires = { "nvim-treesitter/nvim-treesitter" }
            }

            local utils = require("plugins.utils")
            use { "michaelb/sniprun", run = "bash install.sh", config = utils.sniprun }
            use { "akinsho/toggleterm.nvim", config = utils.toggleterm }
            use { "stevearc/aerial.nvim", config = utils.aerial }
            use { "ellisonleao/glow.nvim", branch = "main", config = utils.glow }
            use { "folke/which-key.nvim", config = utils.which_key }
            use { "iamcco/markdown-preview.nvim", run = "cd app && yarn install" }
            use { "jghauser/mkdir.nvim" }
            use { "rcarriga/nvim-notify", config = utils.notify }
            use { "is0n/jaq-nvim", config = utils.jaq }
            use { "lewis6991/gitsigns.nvim", tag = "release", config = utils.gitsigns }
            use { "TimUntersberger/neogit", requires = "nvim-lua/plenary.nvim", config = utils.neogit }
            use { "rmagatti/auto-session", config = utils.auto_session }
            use { "sbdchd/neoformat", config = utils.neoformat }
            use { "gpanders/editorconfig.nvim", config = utils.editorconfig }
            use { "ahmedkhalf/project.nvim", config = utils.project }
            use { "kevinhwang91/nvim-bqf", ft = "qf", config = utils.bqf }
            use { "kevinhwang91/rnvimr", config = utils.rnvimr }
            use {
                "ldelossa/litee.nvim",
                requires = {
                    "ldelossa/litee-calltree.nvim",
                    "ldelossa/litee-symboltree.nvim",
                    "ldelossa/litee-filetree.nvim",
                    "ldelossa/litee-bookmarks.nvim"
                },
                config = utils.litee
            }
            use { "nathom/filetype.nvim", config = utils.filetype }
            use {
                "CRAG666/code_runner.nvim",
                requires = "nvim-lua/plenary.nvim",
                config = utils.code_runner
            }
            use {
                "black-desk/fcitx5-ui.nvim",
                rocks = { 'lgi', 'dbus_proxy' },
                config = utils.fcitx_ui
            }
            -- use { "hkupty/nvimux", config = utils.nvimux }
            use { "aserowy/tmux.nvim", config = utils.tmux }

            local dap = require("plugins.dap")
            use { "mfussenegger/nvim-dap", config = dap.dap }
            use { "rcarriga/nvim-dap-ui", config = dap.dap_ui }
            use { "theHamsta/nvim-dap-virtual-text", config = dap.virtual_text }

            local lang = require("plugins.lang")
            use { "mfussenegger/nvim-jdtls", config = lang.jdtls }

            use { "nvim-lua/popup.nvim" }

            if packer_bootstrap then
                require("packer").sync()
            end
        end,
        config = {
            display = {
                open_fn = function()
                    return require("packer.util").float({ border = "single" })
                end
            },
            git = {
                cmd = "git",
                default_url_format = "https://github.com/%s"
            }
        }
    }
)
