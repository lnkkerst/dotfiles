local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable", -- remove this if you want to bootstrap to HEAD
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    config = function()
      require("plugins.catppuccin")
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("plugins.lualine")
    end,
  },
  {
    "akinsho/bufferline.nvim",
    config = function()
      require("plugins.bufferline")
    end,
  },
  {
    "glepnir/dashboard-nvim",
    config = function()
      require("plugins.dashboard")
    end,
  },
  {
    "kyazdani42/nvim-tree.lua",
    config = function()
      require("plugins.nvim_tree")
    end,
  },
  {
    "stevearc/dressing.nvim",
    config = function()
      require("plugins.dressing")
    end,
  },
  {
    "folke/noice.nvim",
    config = function()
      require("plugins.noice")
    end,
  },
  { "nvim-zh/colorful-winsep.nvim", config = true },
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
    "phaazon/hop.nvim",
    branch = "v2",
    event = "BufReadPost",
    config = function()
      require("plugins.hop")
    end,
  },
  {
    "danymat/neogen",
    requires = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("neogen").setup({
        snippet_engine = "luasnip",
      })
    end,
  },
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({})
    end,
  },
  {
    "kevinhwang91/nvim-ufo",
    requires = "kevinhwang91/promise-async",
    config = function()
      require("plugins.ufo")
    end,
  },
  {
    "junegunn/vim-easy-align",
  },
  {
    "gbprod/yanky.nvim",
    config = function()
      require("yanky").setup({})
      vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
      vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
      vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
      vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")
      vim.keymap.set({ "n", "x" }, "y", "<Plug>(YankyYank)")
    end,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    config = function()
      require("plugins.native_lsp")
    end,
  },
  {
    "williamboman/mason.nvim",
    lazy = true,
    dependencies = { "neovim/nvim-lspconfig" },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = true,
    dependencies = { "neovim/nvim-lspconfig" },
  },
  {
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
      require("plugins.lspsaga")
    end,
  },
  {
    "lukas-reineke/lsp-format.nvim",
    config = function()
      require("lsp-format").setup()
    end,
  },
  {
    "j-hui/fidget.nvim",
    config = function()
      require("fidget").setup({
        sources = { ["null-ls"] = { ignore = true } },
      })
    end,
  },
  { "b0o/schemastore.nvim" },
  { "p00f/clangd_extensions.nvim" },
  { "folke/neodev.nvim" },
  {
    "jose-elias-alvarez/null-ls.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("plugins.null_ls")
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      { "mtoohey31/cmp-fish", ft = "fish" },
      "onsails/lspkind.nvim",
      {
        "saadparwaiz1/cmp_luasnip",
        dependencies = {
          {
            "L3MON4D3/LuaSnip",
            dependencies = { "friendly-snippets" },
            config = function()
              require("luasnip.loaders.from_vscode").lazy_load()
              require("luasnip.loaders.from_snipmate").lazy_load()
            end,
          },
        },
      },
      "hrsh7th/cmp-emoji",
    },
    config = function()
      require("plugins.cmp")
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    lazy = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-frecency.nvim",
        requires = { "tami5/sqlite.lua" },
      },
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
      "nvim-telescope/telescope-media-files.nvim",
    },
    config = function()
      require("plugins.telescope")
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("plugins.treesitter")
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
  {
    "windwp/nvim-ts-autotag",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
  {
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup()
    end,
  },
  {
    "michaelb/sniprun",
    build = "bash install.sh",
    config = function()
      require("plugins.sniprun")
    end,
  },
}, {})
