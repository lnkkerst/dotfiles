local install_path = vim.fn.stdpath("data")
  .. "/site/pack/packer/start/packer.nvim"
local packer_bootstrap = false

---@diagnostic disable-next-line: missing-parameter
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  packer_bootstrap = true
  vim.fn.execute(
    "!git clone https://github.com/wbthomason/packer.nvim " .. install_path
  )
  vim.cmd([[packadd packer.nvim]])
end

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

packer.init({
  autoremove = true,
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "single" })
    end,
  },
  profile = { enabled = true },
})

require("packer").startup(function(use)
  use({ "lewis6991/impatient.nvim" })
  use({ "wbthomason/packer.nvim" })
  use({ "nvim-lua/plenary.nvim" })

  use({
    "catppuccin/nvim",
    as = "catppuccin",
    config = function()
      require("plugins.catppuccin")
    end,
  })
  use({
    "nvim-lualine/lualine.nvim",
    event = "VimEnter",
    requires = { "kyazdani42/nvim-web-devicons" },
    config = function()
      require("plugins.lualine")
    end,
  })
  use({
    "SmiteshP/nvim-navic",
    config = function()
      require("plugins.navic")
    end,
  })
  use({
    "akinsho/bufferline.nvim",
    tag = "v3.*",
    event = "VimEnter",
    after = { "catppuccin" },
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("plugins.bufferline")
    end,
  })
  use({
    "glepnir/dashboard-nvim",
    event = "VimEnter",
    config = function()
      require("plugins.dashboard")
    end,
  })
  use({
    "kyazdani42/nvim-tree.lua",
    requires = {
      "kyazdani42/nvim-web-devicons", -- optional, for file icon
    },
    after = { "catppuccin" },
    config = function()
      require("plugins.nvim_tree")
    end,
  })
  use({
    "folke/trouble.nvim",
    cmd = { "Trouble", "TroubleToggle", "TroubleRefresh" },
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup()
    end,
  })
  use({
    "stevearc/dressing.nvim",
    config = function()
      require("plugins.dressing")
    end,
  })
  use({
    "folke/noice.nvim",
    requires = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require("plugins.noice")
    end,
  })
  use({
    "nvim-zh/colorful-winsep.nvim",
    config = function()
      require("colorful-winsep").setup()
    end,
  })

  use({
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("plugins.indent_blankline")
    end,
  })
  use({
    "rainbowhxch/accelerated-jk.nvim",
    config = function()
      local wk = require("which-key")
      local accelerate_jk = {
        ["j"] = { "<Plug>(accelerated_jk_gj)", "accelerate j" },
        ["k"] = { "<Plug>(accelerated_jk_gk)", "accelerate k" },
      }
      wk.register(accelerate_jk)
    end,
  })
  use({
    "RRethy/vim-illuminate",
    config = function()
      require("plugins.illuminate")
    end,
  })
  use({
    "windwp/nvim-autopairs",
    config = function()
      require("plugins.autopairs")
    end,
  })
  use({
    "numToStr/Comment.nvim",
    config = function()
      require("plugins.comment")
    end,
  })
  use({
    "phaazon/hop.nvim",
    branch = "v2",
    event = "BufReadPost",
    config = function()
      require("plugins.hop")
    end,
  })
  use({
    "abecodes/tabout.nvim",
    wants = { "nvim-treesitter" },
    after = { "nvim-cmp" },
    config = function()
      require("tabout").setup({})
    end,
  })
  use({
    "kevinhwang91/nvim-hlslens",
    config = function()
      require("plugins.hlslens")
    end,
  })
  use({
    "nacro90/numb.nvim",
    config = function()
      require("numb").setup()
    end,
  })
  use({
    "danymat/neogen",
    requires = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("neogen").setup({
        snippet_engine = "luasnip",
      })
    end,
  })
  use({
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  })
  use({
    "NvChad/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({})
    end,
  })
  use({
    "kevinhwang91/nvim-ufo",
    requires = "kevinhwang91/promise-async",
    config = function()
      require("plugins.ufo")
    end,
  })
  use({
    "Pocco81/HighStr.nvim",
    config = function()
      require("plugins.highstr")
    end,
  })
  use({
    "junegunn/vim-easy-align",
  })
  use({
    "gbprod/yanky.nvim",
    config = function()
      require("yanky").setup({})
      vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
      vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
      vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
      vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")
      vim.keymap.set({ "n", "x" }, "y", "<Plug>(YankyYank)")
    end,
  })

  use({
    "neovim/nvim-lspconfig",
    config = function()
      require("plugins.native_lsp")
    end,
  })
  use({ "williamboman/mason.nvim" })
  use({ "williamboman/mason-lspconfig.nvim", after = "mason.nvim" })
  use({ "glepnir/lspsaga.nvim", branch = "main" })
  use({
    "lukas-reineke/lsp-format.nvim",
    after = "nvim-lspconfig",
    config = function()
      require("lsp-format").setup()
    end,
  })
  use({
    "j-hui/fidget.nvim",
    config = function()
      require("fidget").setup({
        sources = { ["null-ls"] = { ignore = true } },
      })
    end,
  })
  use({ "b0o/schemastore.nvim", after = "nvim-lspconfig" })
  use({
    "simrat39/symbols-outline.nvim",
    config = function()
      require("symbols-outline").setup()
    end,
  })
  use({ "jubnzv/virtual-types.nvim" })
  use({ "p00f/clangd_extensions.nvim" })
  use({ "folke/neodev.nvim" })
  use({
    "jose-elias-alvarez/null-ls.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("plugins.null_ls")
    end,
  })

  use({
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    config = function()
      require("plugins.cmp")
    end,
  })
  use({ "hrsh7th/cmp-nvim-lsp", after = { "nvim-lspconfig", "nvim-cmp" } })
  use({ "hrsh7th/cmp-buffer", after = "nvim-cmp" })
  use({ "hrsh7th/cmp-path", after = "nvim-cmp" })
  use({ "hrsh7th/cmp-cmdline", after = "nvim-cmp" })
  use({ "hrsh7th/cmp-nvim-lsp-document-symbol", after = "nvim-cmp" })
  use({ "hrsh7th/cmp-nvim-lsp-signature-help", after = "nvim-cmp" })
  use({ "mtoohey31/cmp-fish", after = "nvim-cmp", ft = "fish" })
  use({
    "David-Kunz/cmp-npm",
    after = "nvim-cmp",
    requires = { "nvim-lua/plenary.nvim" },
  })
  use({ "onsails/lspkind.nvim", after = "nvim-cmp" })
  use({
    "saadparwaiz1/cmp_luasnip",
    after = "LuaSnip",
    requires = {
      {
        "L3MON4D3/LuaSnip",
        after = "friendly-snippets",
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load()
          require("luasnip.loaders.from_snipmate").lazy_load()
        end,
      },
      { "rafamadriz/friendly-snippets" },
    },
  })
  use({ "hrsh7th/cmp-emoji", after = "nvim-cmp" })
  use({ "lukas-reineke/cmp-rg", after = "nvim-cmp" })

  use({
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    requires = { { "nvim-lua/plenary.nvim" } },
    config = function()
      require("plugins.telescope")
    end,
  })
  use({
    "nvim-telescope/telescope-fzf-native.nvim",
    after = "telescope.nvim",
    run = "make",
  })
  use({
    "nvim-telescope/telescope-frecency.nvim",
    after = "telescope.nvim",
    requires = { "tami5/sqlite.lua" },
  })
  use({ "nvim-telescope/telescope-media-files.nvim", after = "telescope.nvim" })

  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require("plugins.treesitter")
    end,
  })
  use({
    "nvim-treesitter/nvim-treesitter-textobjects",
    requires = { "nvim-treesitter/nvim-treesitter" },
  })
  use({
    "p00f/nvim-ts-rainbow",
    requires = { "nvim-treesitter/nvim-treesitter" },
  })
  use({
    "JoosepAlviste/nvim-ts-context-commentstring",
    requires = { "nvim-treesitter/nvim-treesitter" },
  })
  use({
    "nvim-treesitter/nvim-treesitter-context",
    requires = { "nvim-treesitter/nvim-treesitter" },
  })
  use({
    "windwp/nvim-ts-autotag",
    requires = { "nvim-treesitter/nvim-treesitter" },
  })
  use({
    "kylechui/nvim-surround",
    tag = "*",
    config = function()
      require("nvim-surround").setup()
    end,
  })

  use({
    "michaelb/sniprun",
    cmd = { "SnipRun", "'<,'>SnipRun" },
    run = "bash install.sh",
    config = function()
      require("plugins.sniprun")
    end,
  })
  use({
    "akinsho/toggleterm.nvim",
    event = "UIEnter",
    config = function()
      require("plugins.toggleterm")
    end,
  })
  use({
    "folke/which-key.nvim",
    after = "legendary.nvim",
    config = function()
      require("plugins.which_key")
    end,
  })
  use({
    "mrjones2014/legendary.nvim",
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
  })
  use({
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    run = "cd app && pnpm install",
  })
  use({ "jghauser/mkdir.nvim" })
  use({
    "rcarriga/nvim-notify",
    after = "telescope.nvim",
    config = function()
      require("plugins.notify")
    end,
  })
  use({
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPost", "BufNewFile" },
    tag = "release",
    config = function()
      require("gitsigns").setup()
    end,
  })
  use({ "sindrets/diffview.nvim", cmd = "Diffview*" })
  use({
    "TimUntersberger/neogit",
    cmd = "Neogit",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("neogit").setup()
    end,
  })
  use({
    "rmagatti/auto-session",
    config = function()
      require("auto-session").setup({})
    end,
  })
  use({ "sbdchd/neoformat", cmd = "Neoformat" })
  use({ "gpanders/editorconfig.nvim" })
  use({
    "ahmedkhalf/project.nvim",
    after = "nvim-tree.lua",
    config = function()
      require("project_nvim").setup()
    end,
  })
  use({
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
  })
  use({
    "nvim-neotest/neotest",
    after = "nvim-treesitter",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "haydenmeade/neotest-jest",
    },
    config = function()
      require("plugins.neotest")
    end,
  })
  use({
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    config = function()
      require("zen-mode").setup()
    end,
  })
  use({ "jbyuki/venn.nvim", cmd = "VBox*" })
  use({
    "folke/todo-comments.nvim",
    after = "nvim-treesitter",
    event = "BufReadPost",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup()
    end,
  })
  use({
    "krivahtoo/silicon.nvim",
    run = "./install.sh",
    config = function()
      require("silicon").setup({
        font = "JetBrainsMono Nerd Font=16",
        -- theme = "Catppuccin-mocha",
        line_number = true,
      })
    end,
  })
  use({
    "aserowy/tmux.nvim",
    config = function()
      require("plugins.tmux")
    end,
  })
  use("famiu/bufdelete.nvim")
  use({
    "stevearc/aerial.nvim",
    config = function()
      require("aerial").setup()
    end,
  })

  use({
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
    config = function()
      require("plugins.dap")
    end,
  })
  use({ "rcarriga/nvim-dap-ui", after = "nvim-dap" })
  use({ "theHamsta/nvim-dap-virtual-text", after = "nvim-dap" })

  use({ "mfussenegger/nvim-jdtls", ft = "java" })
  use({ "simrat39/rust-tools.nvim" })
  use({
    "saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    requires = { { "nvim-lua/plenary.nvim" } },
    config = function()
      vim.api.nvim_create_autocmd("BufRead", {
        group = vim.api.nvim_create_augroup("CmpSourceCargo", { clear = true }),
        pattern = "Cargo.toml",
        callback = function()
          require("cmp").setup.buffer({ sources = { { name = "crates" } } })
        end,
      })
    end,
  })
  use({ "posva/vim-vue" })
  use({ "neoclide/vim-jsx-improve" })
  use({ "jose-elias-alvarez/typescript.nvim" })

  use({ "nvim-lua/popup.nvim" })

  if packer_bootstrap then
    require("packer").sync()
  end
end)

if packer_bootstrap then
  print("Please wait and then restart nvim.")
  return
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])
