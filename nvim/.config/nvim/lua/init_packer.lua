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
    cmd = "NvimTree*",
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
    event = "VimEnter",
    config = function()
      require("colorful-winsep").setup()
    end,
  })
  use({
    "kevinhwang91/nvim-hlslens",
    config = function()
      require("plugins.hlslens")
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
    event = "InsertEnter",
    config = function()
      require("plugins.autopairs")
    end,
  })
  use({
    "numToStr/Comment.nvim",
    keys = {
      { "n", "gc" },
      { "n", "gb" },
      { "n", "gc" },
      { "n", "gc" },
      { "n", "gc" },
      { "v", "gb" },
      { "v", "gc" },
    },
    config = function()
      require("plugins.comment")
    end,
  })
  use({
    "danymat/neogen",
    requires = { "nvim-treesitter/nvim-treesitter" },
    cmd = "Neogen",
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
    "gbprod/yanky.nvim",
    event = "VimEnter",
    config = function()
      require("plugins.yanky")
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
  use({ "tpope/vim-repeat" })
  use({
    "ggandor/leap.nvim",
    config = function()
      require("leap").add_default_mappings()
    end,
  })
  use({
    "ggandor/flit.nvim",
    config = function()
      require("flit").setup()
    end,
  })
  use({
    "nacro90/numb.nvim",
    config = function()
      require("numb").setup()
    end,
  })

  use({
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    config = function()
      require("plugins.native_lsp")
    end,
  })
  use({
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  })
  use({
    "williamboman/mason-lspconfig.nvim",
    requires = { "neovim/nvim-lspconfig" },
    config = function()
      require("mason-lspconfig").setup()
    end,
  })
  use({
    "glepnir/lspsaga.nvim",
    branch = "main",
    after = "nvim-lspconfig",
    config = function()
      require("plugins.lspsaga")
    end,
  })
  use({
    "lukas-reineke/lsp-format.nvim",
    config = function()
      require("lsp-format").setup()
    end,
  })
  use({
    "j-hui/fidget.nvim",
    after = "nvim-lspconfig",
    config = function()
      require("fidget").setup({
        sources = { ["null-ls"] = { ignore = true } },
      })
    end,
  })
  use({ "b0o/schemastore.nvim" })
  use({ "p00f/clangd_extensions.nvim" })
  use({
    "jose-elias-alvarez/null-ls.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    event = "BufReadPre",
    config = function()
      require("plugins.null_ls")
    end,
  })
  -- use({
  --   "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  --   config = function()
  --     require("lsp_lines").setup()
  --     vim.api.nvim_create_user_command(
  --       "LspLinesToggle",
  --       "lua require('lsp_lines').toggle()",
  --       {}
  --     )
  --     vim.diagnostic.config({
  --       virtual_text = false,
  --     })
  --   end,
  -- })

  use({
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    requires = {
      { "lukas-reineke/cmp-under-comparator" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-cmdline" },
      { "hrsh7th/cmp-nvim-lsp-signature-help" },
      { "hrsh7th/cmp-emoji" },
      { "mtoohey31/cmp-fish" },
      { "onsails/lspkind.nvim" },
    },
    config = function()
      require("plugins.cmp")
    end,
  })
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

  use({
    "nvim-telescope/telescope.nvim",
    cmd = { "Telescope", "Cheatsheet" },
    requires = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
      {
        "nvim-telescope/telescope-frecency.nvim",
        requires = { "tami5/sqlite.lua" },
      },
      { "nvim-telescope/telescope-media-files.nvim" },
    },
    config = function()
      require("plugins.telescope")
    end,
  })
  use({
    "sudormrfbin/cheatsheet.nvim",
    cmd = { "Cheatsheet" },
    requires = {
      { "nvim-telescope/telescope.nvim" },
      { "nvim-lua/popup.nvim" },
      { "nvim-lua/plenary.nvim" },
    },
  })

  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    event = "BufReadPost",
    module = "nvim-treesitter",
    config = function()
      require("plugins.treesitter")
    end,
  })
  use({ "nvim-treesitter/nvim-treesitter-textobjects" })
  use({ "JoosepAlviste/nvim-ts-context-commentstring" })
  use({ "nvim-treesitter/nvim-treesitter-context" })
  use({ "mrjones2014/nvim-ts-rainbow" })
  use({
    "windwp/nvim-ts-autotag",
    requires = { "nvim-treesitter/nvim-treesitter" },
  })
  use({
    "kylechui/nvim-surround",
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
    "skywind3000/asyncrun.vim",
    cmd = { "AsyncRun", "AsyncStop", "AsyncReset" },
  })
  use({
    "stevearc/overseer.nvim",
    config = function()
      require("plugins.overseer")
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
  use({
    "krivahtoo/silicon.nvim",
    run = "./install.sh build",
    config = function()
      require("silicon").setup({
        font = "JetbrainsMono Nerd Font",
        theme = "Catppuccin-mocha",
        line_number = true,
      })
    end,
  })
  use({
    "ellisonleao/glow.nvim",
    cmd = "Glow",
    config = function()
      require("glow").setup()
    end,
  })
  use({
    "rcarriga/nvim-notify",
    config = function()
      require("plugins.notify")
    end,
  })
  use({
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("gitsigns").setup()
    end,
  })
  use({
    "TimUntersberger/neogit",
    requires = "nvim-lua/plenary.nvim",
    cmd = "Neogit",
  })
  use({ "sindrets/diffview.nvim", cmd = "Diffview*" })
  use({ "sbdchd/neoformat", cmd = "Neoformat" })
  use({ "gpanders/editorconfig.nvim" })
  use({
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup({
        ignore_lsp = { "null-ls" },
      })
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
    "folke/todo-comments.nvim",
    after = "nvim-treesitter",
    event = "BufReadPost",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup()
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
    opt = true,
    module = "dap",
    config = function()
      require("plugins.dap")
    end,
  })
  use({
    "rcarriga/nvim-dap-ui",
    requires = { "mfussenegger/nvim-dap" },
    opt = true,
    module = "dapui",
  })
  use({
    "theHamsta/nvim-dap-virtual-text",
    requires = { "mfussenegger/nvim-dap" },
  })

  use({ "simrat39/rust-tools.nvim" })
  use({ "nanotee/sqls.nvim" })

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
