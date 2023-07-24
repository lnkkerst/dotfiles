local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { "nvim-lua/plenary.nvim" },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true,
    config = function()
      require("plugins.catppuccin")
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VimEnter",
    dependencies = { "kyazdani42/nvim-web-devicons" },
    config = function()
      require("plugins.lualine")
    end,
  },
  {
    "akinsho/bufferline.nvim",
    version = "v3.*",
    event = "VimEnter",
    dependencies = { "kyazdani42/nvim-web-devicons", "catppuccin/nvim" },
    config = function()
      require("plugins.bufferline")
    end,
  },
  {
    "glepnir/dashboard-nvim",
    event = "VimEnter",
    config = function()
      require("plugins.dashboard")
    end,
  },
  {
    "kyazdani42/nvim-tree.lua",
    cmd = "NvimTreeToggle",
    dependencies = {
      "kyazdani42/nvim-web-devicons",
    },
    config = function()
      require("plugins.nvim_tree")
    end,
  },
  {
    "folke/trouble.nvim",
    cmd = { "Trouble", "TroubleToggle", "TroubleRefresh" },
    dependencies = "kyazdani42/nvim-web-devicons",
    config = true,
  },
  {
    "stevearc/dressing.nvim",
    enabled = true,
    config = function()
      require("plugins.dressing")
    end,
  },
  {
    "folke/noice.nvim",
    enabled = false,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require("plugins.noice")
    end,
  },
  {
    "nvim-zh/colorful-winsep.nvim",
    event = "VimEnter",
    config = true,
  },
  {
    "kevinhwang91/nvim-hlslens",
    event = { "CmdlineEnter" },
    config = function()
      require("plugins.hlslens")
    end,
  },
  { "nvim-pack/nvim-spectre", enabled = false },
  {
    "nvim-neorg/neorg",
    enabled = false,
    build = ":Neorg sync-parsers",
    opts = {
      load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.concealer"] = {}, -- Adds pretty icons to your documents
        ["core.dirman"] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
              notes = "~/notes",
            },
          },
        },
      },
    },
    dependencies = { { "nvim-lua/plenary.nvim" } },
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("plugins.indent_blankline")
    end,
  },
  {
    "rainbowhxch/accelerated-jk.nvim",
    config = function()
      local wk = require("which-key")
      local accelerate_jk = {
        ["j"] = { "<Plug>(accelerated_jk_gj)", "accelerate j" },
        ["k"] = { "<Plug>(accelerated_jk_gk)", "accelerate k" },
      }
      wk.register(accelerate_jk)
    end,
  },
  {
    "RRethy/vim-illuminate",
    config = function()
      require("plugins.illuminate")
    end,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("plugins.autopairs")
    end,
  },
  {
    "numToStr/Comment.nvim",
    config = function()
      require("plugins.comment")
    end,
  },
  {
    "danymat/neogen",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    cmd = "Neogen",
    config = {
      snippet_engine = "luasnip",
    },
  },
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = true,
  },
  {
    "NvChad/nvim-colorizer.lua",
    config = true,
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
    config = function()
      require("plugins.ufo")
    end,
  },
  {
    "gbprod/yanky.nvim",
    event = "VimEnter",
    config = function()
      require("plugins.yanky")
    end,
  },
  {
    "abecodes/tabout.nvim",
    dependencies = { "nvim-treesitter" },
    config = true,
  },
  { "tpope/vim-repeat" },
  {
    "ggandor/leap.nvim",
    config = function()
      require("leap").add_default_mappings()
    end,
  },
  {
    "ggandor/flit.nvim",
    config = true,
  },
  {
    "nacro90/numb.nvim",
    event = { "CmdlineEnter" },
    config = true,
  },

  {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    config = function()
      require("plugins.native_lsp")
    end,
  },
  {
    "williamboman/mason.nvim",
    config = true,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    config = true,
  },
  {
    "nvimdev/lspsaga.nvim",
    -- branch = "main",
    dependencies = { "nvim-lspconfig" },
    config = function()
      require("plugins.lspsaga")
    end,
  },
  {
    "lukas-reineke/lsp-format.nvim",
    config = true,
  },
  {
    "j-hui/fidget.nvim",
    tag = "legacy",
    dependencies = "nvim-lspconfig",
    config = function()
      require("fidget").setup({
        sources = { ["null-ls"] = { ignore = true } },
        window = { blend = 0 },
      })
    end,
  },
  { "b0o/schemastore.nvim" },
  { "p00f/clangd_extensions.nvim" },
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "BufReadPre",
    config = function()
      require("plugins.null_ls")
    end,
  },
  { "lvimuser/lsp-inlayhints.nvim", config = true, branch = "anticonceal" },

  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      { "lukas-reineke/cmp-under-comparator" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-cmdline" },
      { "hrsh7th/cmp-nvim-lsp-signature-help" },
      { "hrsh7th/cmp-emoji" },
      { "mtoohey31/cmp-fish" },
      { "onsails/lspkind.nvim" },
      {
        "saadparwaiz1/cmp_luasnip",
        dependencies = {
          {
            "L3MON4D3/LuaSnip",
            dependencies = "friendly-snippets",
            config = function()
              require("luasnip.loaders.from_vscode").lazy_load()
              require("luasnip.loaders.from_snipmate").lazy_load()
            end,
          },
          { "rafamadriz/friendly-snippets" },
        },
      },
    },
    config = function()
      require("plugins.cmp")
    end,
  },
  -- {
  --   "zbirenbaum/copilot.lua",
  --   config = true,
  -- },
  -- {
  --   "zbirenbaum/copilot-cmp",
  --   dependencies = { "copilot.lua" },
  --   config = true,
  -- },
  {
    "dpayne/CodeGPT.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("codegpt.config")
      vim.g["codegpt_commands"] = {
        -- ["doc"] = {
        --   model = "gpt-3.5-turbo-16k",
        --   max_tokens = 16384,
        -- },
      }
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    cmd = { "Telescope", "Cheatsheet" },
    lazy = true,
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      {
        "nvim-telescope/telescope-frecency.nvim",
        dependencies = { "tami5/sqlite.lua" },
      },
      { "nvim-telescope/telescope-media-files.nvim" },
    },
    config = function()
      require("plugins.telescope")
    end,
  },
  {
    "sudormrfbin/cheatsheet.nvim",
    cmd = { "Cheatsheet" },
    dependencies = {
      { "nvim-telescope/telescope.nvim" },
      { "nvim-lua/popup.nvim" },
      { "nvim-lua/plenary.nvim" },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "BufReadPost",
    config = function()
      require("plugins.treesitter")
    end,
  },
  { "nvim-treesitter/nvim-treesitter-textobjects" },
  { "JoosepAlviste/nvim-ts-context-commentstring" },
  { "nvim-treesitter/nvim-treesitter-context" },
  { "HiPhish/nvim-ts-rainbow2" },
  {
    "windwp/nvim-ts-autotag",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
  {
    "kylechui/nvim-surround",
    config = true,
  },

  {
    "michaelb/sniprun",
    -- cmd = { "SnipRun", "'<,'>SnipRun" },
    build = "bash install.sh",
    config = function()
      require("plugins.sniprun")
    end,
  },
  {
    "skywind3000/asyncrun.vim",
    cmd = { "AsyncRun", "AsyncStop", "AsyncReset" },
  },
  {
    "stevearc/overseer.nvim",
    config = function()
      require("plugins.overseer")
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    event = "UIEnter",
    config = function()
      require("plugins.toggleterm")
    end,
  },
  {
    "folke/which-key.nvim",
    -- dependencies = "legendary.nvim",
    config = function()
      require("plugins.which_key")
    end,
  },
  {
    "mrjones2014/legendary.nvim",
    enabled = false,
    config = function()
      require("legendary").setup()
      local wk = require("which-key")
      local legendary = {
        ["<C-A-p>"] = { "<cmd>Legendary<cr>", "Legendary" },
      }
      wk.register(legendary, { mode = "n" })
      wk.register(legendary, { mode = "x" })
      wk.register(legendary, { mode = "t" })
      wk.register(legendary, { mode = "i" })
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    build = "cd app && pnpm install",
  },
  {
    "krivahtoo/silicon.nvim",
    build = "./install.sh build",
    config = function()
      require("silicon").setup({
        font = "JetbrainsMono Nerd Font",
        theme = "Catppuccin-mocha",
        line_number = true,
      })
    end,
  },
  {
    "ellisonleao/glow.nvim",
    cmd = "Glow",
    config = true,
  },
  {
    "rcarriga/nvim-notify",
    config = function()
      require("plugins.notify")
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = true,
  },
  {
    "TimUntersberger/neogit",
    dependencies = "nvim-lua/plenary.nvim",
    cmd = "Neogit",
  },
  {
    "sindrets/diffview.nvim",--[[  cmd = "Diffview*" ]]
  },
  {
    "sbdchd/neoformat",
    cmd = "Neoformat",
  },
  { "gpanders/editorconfig.nvim" },
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup({
        manual_mode = true,
        ignore_lsp = { "null-ls" },
      })
    end,
  },
  {
    "kevinhwang91/nvim-bqf",
    ft = "qf",
    config = function()
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
    end,
  },
  {
    "junegunn/fzf",
    build = function()
      vim.fn["fzf#install"]()
    end,
  },
  {
    "folke/todo-comments.nvim",
    enabled = false,
    event = "BufReadPost",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter" },
    config = true,
  },
  {
    "aserowy/tmux.nvim",
    config = function()
      require("plugins.tmux")
    end,
    cond = not vim.g.vscode,
  },
  { "famiu/bufdelete.nvim" },
  {
    "stevearc/aerial.nvim",
    cmd = { "AerialToggle" },
    config = true,
  },
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-treesitter/nvim-treesitter" },
    },
    config = function()
      require("plugins.refactoring")
    end,
  },

  {
    "mfussenegger/nvim-dap",
    cmd = {
      "DapSetLogLevel",
      "DapShowLog",
      "DapContinue",
      "DapToggleBreakpoint",
      "DapToggleRepl",
      "DapStepOver",
      "DapStepInto",
      "DapStepOut",
      "DapTerminate",
    },
    lazy = true,
    config = function()
      require("plugins.dap")
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap" },
    lazy = true,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    dependencies = { "mfussenegger/nvim-dap" },
  },

  { "simrat39/rust-tools.nvim" },
  {
    "Saecki/crates.nvim",
    event = "BufRead Cargo.toml",
    config = function()
      require("plugins.crates")
    end,
  },

  { "nvim-lua/popup.nvim" },

  {
    "eandrju/cellular-automaton.nvim",
    cmd = "CellularAutomaton",
  },
}, {
  defaults = {},
  ui = { border = "single" },
})
