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
        local ui = require("plugins.ui")
        use "wbthomason/packer.nvim"
        use {"marko-cerovac/material.nvim", config = ui.material}
        use {
            "nvim-lualine/lualine.nvim",
            requires = {"kyazdani42/nvim-web-devicons", opt = true},
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
        use {"lukas-reineke/indent-blankline.nvim", config = ui.indent_blankline}
        use {
            "glepnir/dashboard-nvim",
            requires = {"nvim-telescope/telescope.nvim"},
            config = ui.dashboard
        }
        use {
            "kyazdani42/nvim-tree.lua",
            requires = {
                "kyazdani42/nvim-web-devicons" -- optional, for file icon
            },
            config = ui.tree
        }

        local editor = require("plugins.editor")
        use {"rhysd/accelerated-jk"}
        use {"yamatsum/nvim-cursorline", config = editor.cursorline}
        use {"windwp/nvim-autopairs", config = editor.autopairs}

        local lsp = require("plugins.lsp")
        use {"neovim/nvim-lspconfig", config = lsp.lspconfig}
        use {"tami5/lspsaga.nvim", branch = "nvim6.0"}
        use {"williamboman/nvim-lsp-installer", config = lsp.lsp_installer}

        local cmp = require("plugins.cmp")
        use {"hrsh7th/cmp-nvim-lsp", config = cmp.cmp}
        use "hrsh7th/cmp-buffer"
        use "hrsh7th/cmp-path"
        use "hrsh7th/cmp-cmdline"
        use "hrsh7th/nvim-cmp"
        use "hrsh7th/cmp-vsnip"
        use "hrsh7th/vim-vsnip"
        use "f3fora/cmp-spell"

        local ts = require("plugins.ts")
        use {
            "nvim-treesitter/nvim-treesitter",
            run = ":TSUpdate",
            config = ts.treesitter
        }
        use {"nvim-treesitter/nvim-treesitter-textobjects"}
        use {"windwp/nvim-ts-autotag", config = ts.autotag}
        use {"p00f/nvim-ts-rainbow"}

        local utils = require("plugins.utils")
        use {"michaelb/sniprun", run = "bash install.sh", config = utils.sniprun}
        use {"sbdchd/neoformat"}
        use {"akinsho/toggleterm.nvim", config = utils.toggleterm}

        if packer_bootstrap then
            require("packer").sync()
        end
    end
)
