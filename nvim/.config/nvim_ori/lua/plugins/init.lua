local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({
        "git", "clone", "--depth", "1",
        "https://github.com/wbthomason/packer.nvim", install_path
    })
end

return require("packer").startup(function(use)
    use {"wbthomason/packer.nvim", config = function() end}
    use {"neovim/nvim-lspconfig", config = function() end}
    use {"glepnir/lspsaga.nvim", config = require("plugins.lsp.lspsaga")}
    use {
        "hrsh7th/nvim-cmp",
        requires = {
            {"hrsh7th/cmp-buffer"}, {"hrsh7th/cmp-path"},
            {"hrsh7th/cmp-nvim-lsp"}, {"hrsh7th/cmp-vsnip"},
            {"hrsh7th/cmp-nvim-lua"}, {"lukas-reineke/cmp-under-comparator"},
            {"f3fora/cmp-spell"}, {"saadparwaiz1/cmp_luasnip"}
        },

        config = require("plugins.lsp.cmp")
    }
    use {
        "williamboman/nvim-lsp-installer",
        config = require("plugins.lsp.lsp_installer")
    }
    use {"marko-cerovac/material.nvim", config = require("plugins.ui.material")}
    use {
        "nvim-lualine/lualine.nvim",
        requires = {"kyazdani42/nvim-web-devicons"},
        config = require("plugins.ui.lualine")
    }
    use {"arkav/lualine-lsp-progress", config = function() end}
    use {"glepnir/dashboard-nvim", config = require("plugins.ui.dashboard")}
    use {
        "akinsho/bufferline.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = require("plugins.ui.bufferline")
    }
    use {"liuchengxu/vim-which-key", config = function() end}
    use {
        "nvim-telescope/telescope.nvim",
        requires = {{"nvim-lua/plenary.nvim"}},
        config = require("plugins.utils.telescope")
    }
    use {
        "nvim-telescope/telescope-media-files.nvim",
        requires = {
            "nvim-telescope/telescope.nvim", "nvim-lua/popup.nvim",
            "nvim-lua/plenary.nvim"
        }
    }
    use {
        "lukas-reineke/indent-blankline.nvim",
        config = require("plugins.ui.indent_blankline")
    }
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = require("plugins.editor.treesitter")
    }
    use {"SmiteshP/nvim-gps", requires = "nvim-treesitter/nvim-treesitter"}
    use {
        "kyazdani42/nvim-tree.lua",
        requires = {
            "kyazdani42/nvim-web-devicons" -- optional, for file icon
        },
        config = require("plugins.ui.tree")
    }
    use {"nvim-treesitter/nvim-treesitter-textobjects", config = function() end}
    use {"romgrk/nvim-treesitter-context", config = function() end}
    use {"p00f/nvim-ts-rainbow", config = function() end}
    use {"sbdchd/neoformat", config = function() end}
    use {"windwp/nvim-ts-autotag", config = require("plugins.lang.ts_autotag")}
    use {"andymass/vim-matchup", config = require("plugins.editor.matchup")}
    use {"rhysd/accelerated-jk", config = function() end}
    use {
        "lewis6991/gitsigns.nvim",
        -- tag = 'release' -- To use the latest release
        config = require("plugins.utils.gitsigns")
    }
    use {"justinmk/vim-sneak", config = function() end}
    use {
        "junegunn/vim-easy-align",
        config = require("plugins.editor.easy_align")
    }
    use {"itchyny/vim-cursorword", config = function() end}
    use {"thinca/vim-quickrun", config = function() end}
    use {
        "gelguy/wilder.nvim",
        requires = {"romgrk/fzy-lua-native"},
        config = require("plugins.utils.wilder")
    }
    use {"nathom/filetype.nvim"}
    use {"iamcco/markdown-preview.nvim", run = "cd app && yarn install"}
    use {"tpope/vim-fugitive", config = function() end}
    use {"rust-lang/rust.vim", config = require("plugins.lang.rust")}
    use {"windwp/nvim-autopairs", config = require("plugins.editor.autopairs")}
    use {"vimlab/split-term.vim", config = function() end}
    use {"mfussenegger/nvim-dap", config = require("plugins.utils.dap")}
    use {"rcarriga/nvim-dap-ui", config = require("plugins.utils.dap_ui")}
    use {
        "theHamsta/nvim-dap-virtual-text",
        config = require("plugins.utils.dap_virtual_text")
    }
    use {
        "rmagatti/auto-session",
        config = require("plugins.utils.auto_session")
    }
    -- use {
    --     'CRAG666/code_runner.nvim',
    --     requires = 'nvim-lua/plenary.nvim',
    --     branch = "main",
    --     config = require("plugins.utils.code_runner")
    -- }
    use {"michaelb/sniprun", run = "bash ./install.sh"}
    use {"numToStr/FTerm.nvim", config = require("plugins.utils.fterm")}
    use {"phaazon/hop.nvim", config = require("plugins.editor.hop")}
    use {"hrsh7th/vim-eft", config = require("plugins.editor.eft")}
    use {
        "RishabhRD/nvim-lsputils",
        requires = {{"RishabhRD/popfix"}},
        config = require("plugins.lsp.lsputils")
    }
    use {'abecodes/tabout.nvim', config = require("plugins.editor.tabout")}
    use {'stevearc/aerial.nvim', config = require("plugins.utils.aerial")}
    use {'wfxr/minimap.vim', config = require("plugins.utils.minimap")}
    use {
        'sindrets/diffview.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = require("plugins.utils.diffview")
    }
    use {"ray-x/lsp_signature.nvim"}
    if packer_bootstrap then require("packer").sync() end
end)
