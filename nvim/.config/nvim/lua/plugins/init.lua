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

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

packer.init({
  autoremove = true,
})

require("packer").startup({
  function(use)
    use({ "lewis6991/impatient.nvim" })
    use({ "wbthomason/packer.nvim" })
    use({ "nvim-lua/plenary.nvim" })

    local ui = require("plugins.ui")
    use({
      "catppuccin/nvim",
      as = "catppuccin",
      config = ui.catppuccin,
    })
    use({ "folke/tokyonight.nvim", config = ui.tokyonight })
    use({ "sainnhe/gruvbox-material", config = ui.gruvbox_material })
    use({ "marko-cerovac/material.nvim", config = ui.material })
    use({ "tomasiser/vim-code-dark" })
    use({ "shaunsingh/nord.nvim", config = ui.nord })
    use({
      "nvim-lualine/lualine.nvim",
      opt = true,
      event = "BufReadPost",
      requires = { "kyazdani42/nvim-web-devicons", opt = true },
      config = ui.lualine,
    })
    use({
      "SmiteshP/nvim-navic",
      config = ui.navic,
    })
    use({
      "akinsho/bufferline.nvim",
      event = "BufReadPost",
      requires = "kyazdani42/nvim-web-devicons",
      config = ui.bufferline,
    })
    use({
      "goolord/alpha-nvim",
      event = "BufWinEnter",
      requires = { "kyazdani42/nvim-web-devicons" },
      config = ui.alpha,
    })
    use({
      "kyazdani42/nvim-tree.lua",
      cmd = { "NvimTree*" },
      event = { "BufReadPost", "BufNewFile" },
      requires = {
        "kyazdani42/nvim-web-devicons", -- optional, for file icon
      },
      config = ui.tree,
    })
    use({
      "xiyaowong/nvim-transparent",
      cmd = "Transparent*",
      config = ui.transparent,
    })
    use({
      "petertriho/nvim-scrollbar",
      config = ui.scrollbar,
    })
    -- use({ "beauwilliams/focus.nvim", config = ui.focus })
    use({
      "folke/trouble.nvim",
      cmd = { "Trouble", "TroubleToggle", "TroubleRefresh" },
      requires = "kyazdani42/nvim-web-devicons",
      config = ui.trouble,
    })
    use({
      "sidebar-nvim/sidebar.nvim",
      cmd = "SidebarNvim*",
      config = ui.sidebar,
    })
    use({
      "stevearc/dressing.nvim",
      -- after = "telescope.nvim",
      config = ui.dressing,
    })

    local editor = require("plugins.editor")
    use({
      "lukas-reineke/indent-blankline.nvim",
      event = "BufReadPost",
      config = editor.indent_blankline,
    })
    use({
      "rainbowhxch/accelerated-jk.nvim",
      config = editor.accelerated_jk,
    })
    use({
      "yamatsum/nvim-cursorline",
      event = "BufReadPost",
      config = editor.cursorline,
    })
    use({
      "windwp/nvim-autopairs",
      after = "nvim-treesitter",
      cmd = "BufEnter",
      config = editor.autopairs,
    })
    use({
      "numToStr/Comment.nvim",
      after = "nvim-treesitter",
      config = editor.comment,
    })
    use({
      "phaazon/hop.nvim",
      branch = "v2",
      event = "BufReadPost",
      config = editor.hop,
    })
    use({
      "kevinhwang91/nvim-hlslens",
      config = editor.hlslens,
    })
    use({
      "haringsrob/nvim_context_vt",
      after = "nvim-treesitter",
      config = editor.context_vt,
    })
    use({ "ethanholz/nvim-lastplace", config = editor.lastplace })
    use({
      "nacro90/numb.nvim",
      event = "CmdlineEnter",
      config = editor.numb,
    })
    use({
      "danymat/neogen",
      requires = { "nvim-treesitter/nvim-treesitter" },
      config = editor.neogen,
    })
    use({
      "max397574/better-escape.nvim",
      event = "InsertEnter",
      config = editor.better_escape,
    })
    use({
      "norcalli/nvim-colorizer.lua",
      -- event = "BufReadPost",
      config = editor.colorizer,
    })
    use({
      "kevinhwang91/nvim-ufo",
      requires = "kevinhwang91/promise-async",
      config = editor.ufo,
    })
    use({ "Pocco81/HighStr.nvim", config = editor.highstr })
    use({
      "gbprod/yanky.nvim",
      config = editor.yanky,
    })
    use({
      "junegunn/vim-easy-align",
      config = editor.easy_align,
    })

    local lsp = require("plugins.lsp")
    use({
      "neovim/nvim-lspconfig",
      ft = {
        "cpp",
        "c",
        "typescript",
        "javascript",
        "vue",
        "lua",
        "html",
        "css",
        "rust",
        "json",
        "jsonc",
        "markdown",
        "javascriptreact",
        "typescriptreact",
        "fish",
      },
      config = lsp.lspconfig,
    })
    use({
      "williamboman/mason.nvim",
      cmd = "Mason",
      after = "nvim-lspconfig",
      config = lsp.mason,
    })
    use({
      "williamboman/mason-lspconfig.nvim",
      after = "mason.nvim",
      config = lsp.mason_lspconfig,
    })
    use({
      "lukas-reineke/lsp-format.nvim",
      after = "nvim-lspconfig",
      config = lsp.lsp_format,
    })
    use({
      "glepnir/lspsaga.nvim",
      after = "nvim-lsp-setup",
      config = lsp.lspsaga,
    })
    use({
      "j-hui/fidget.nvim",
      after = "nvim-lsp-setup",
      config = lsp.fidget,
    })
    use({
      "folke/lsp-colors.nvim",
      after = "nvim-lsp-setup",
      config = lsp.lsp_colors,
    })
    use({
      "b0o/schemastore.nvim",
      after = "nvim-lspconfig",
    })
    use({
      "simrat39/symbols-outline.nvim",
      after = "nvim-lsp-setup",
      config = lsp.symbols_outline,
    })
    use({
      "jubnzv/virtual-types.nvim",
      after = "nvim-lsp-setup",
      config = lsp.virtual_types,
    })
    use({
      "p00f/clangd_extensions.nvim",
      after = "nvim-lspconfig",
    })
    use({
      "jose-elias-alvarez/typescript.nvim",
      ft = { "ts", "tsx", "vue", "js", "jsx", "cjs", "mjs", "html" },
    })
    use({
      "folke/lua-dev.nvim",
      after = "nvim-lspconfig",
    })
    use({
      "junnplus/nvim-lsp-setup",
      after = {
        "nvim-lspconfig",
        "mason.nvim",
        "mason-lspconfig.nvim",
        "schemastore.nvim",
        "lua-dev.nvim",
        "clangd_extensions.nvim",
      },
      requires = {
        "neovim/nvim-lspconfig",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
      },
      config = lsp.lsp_setup,
    })
    use({
      "jose-elias-alvarez/null-ls.nvim",
      after = "nvim-lsp-setup",
      requires = { "nvim-lua/plenary.nvim" },
      config = lsp.null,
    })
    use({
      "amrbashir/nvim-docs-view",
      cmd = { "DocsViewToggle" },
      config = lsp.docs_view,
    })
    use({ "mfussenegger/nvim-lint", config = lsp.lint })
    use({ "jubnzv/virtual-types.nvim" })

    local cmp = require("plugins.cmp")
    use({
      "hrsh7th/nvim-cmp",
      event = { "InsertEnter", "CmdlineEnter" },
      config = cmp.cmp,
    })
    use({
      "hrsh7th/cmp-nvim-lsp",
      after = { "nvim-lspconfig", "nvim-cmp" },
    })
    use({
      "hrsh7th/cmp-buffer",
      after = "nvim-cmp",
    })
    use({ "hrsh7th/cmp-path", after = "nvim-cmp" })
    use({ "hrsh7th/cmp-cmdline", after = "nvim-cmp" })
    use({ "f3fora/cmp-spell", after = "nvim-cmp" })
    use({ "lukas-reineke/cmp-under-comparator" })
    use({ "hrsh7th/cmp-nvim-lsp-document-symbol", after = "nvim-cmp" })
    use({ "hrsh7th/cmp-nvim-lsp-signature-help", after = "nvim-cmp" })
    use({ "mtoohey31/cmp-fish", after = "nvim-cmp", ft = "fish" })
    use({
      "petertriho/cmp-git",
      after = "nvim-cmp",
      requires = "nvim-lua/plenary.nvim",
      config = cmp.git,
    })
    use({ "andersevenrud/cmp-tmux", after = "nvim-cmp" })
    use({
      "David-Kunz/cmp-npm",
      after = "nvim-cmp",
      requires = {
        "nvim-lua/plenary.nvim",
      },
      config = cmp.npm,
    })
    use({ "onsails/lspkind.nvim", after = "nvim-cmp" })
    use({
      "saadparwaiz1/cmp_luasnip",
      after = "LuaSnip",
      requires = {
        {
          "L3MON4D3/LuaSnip",
          after = "friendly-snippets",
          -- event = "InsertCharPre",
          config = cmp.luasnip,
        },
        {
          "rafamadriz/friendly-snippets",
        },
      },
    })
    use({ "ray-x/cmp-treesitter", after = "nvim-cmp" })
    use({ "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" })
    use({ "hrsh7th/cmp-calc", after = "nvim-cmp" })
    use({ "hrsh7th/cmp-omni", after = "nvim-cmp" })
    use({ "hrsh7th/cmp-emoji", after = "nvim-cmp" })
    use({
      "dmitmel/cmp-cmdline-history",
      after = "nvim-cmp",
      config = cmp.cmdline_history,
    })

    local telescope = require("plugins.telescope")
    use({
      "nvim-telescope/telescope.nvim",
      -- cmd = { "Telescope", "Legendary" },
      requires = { { "nvim-lua/plenary.nvim" } },
      config = telescope.telescope,
    })
    use({
      "nvim-telescope/telescope-fzf-native.nvim",
      after = "telescope.nvim",
      cmd = "Telescope",
      run = "make",
      config = ui.telescope_fzf_native,
    })
    use({
      "AckslD/nvim-neoclip.lua",
      after = "telescope.nvim",
      cmd = "Telescope",
      requires = { "tami5/sqlite.lua", module = "sqlite" },
      config = telescope.neoclip,
    })
    use({
      "nvim-telescope/telescope-file-browser.nvim",
      after = "telescope.nvim",
      cmd = "Telescope",
      config = telescope.file_browser,
    })
    use({
      "nvim-telescope/telescope-packer.nvim",
      after = "telescope.nvim",
      cmd = "Telescope",
      config = telescope.packer,
    })
    use({
      "nvim-telescope/telescope-symbols.nvim",
      after = "telescope.nvim",
      cmd = "Telescope",
      config = telescope.symbols,
    })
    use({
      "nvim-telescope/telescope-github.nvim",
      after = "telescope.nvim",
      cmd = "Telescope",
      config = telescope.github,
    })
    use({
      "nvim-telescope/telescope-frecency.nvim",
      after = "telescope.nvim",
      cmd = "Telescope",
      requires = { "tami5/sqlite.lua" },
      config = telescope.frecency,
    })
    use({
      "nvim-telescope/telescope-project.nvim",
      after = "telescope.nvim",
      config = telescope.project,
    })
    use({
      "nvim-telescope/telescope-media-files.nvim",
      after = "telescope.nvim",
      cmd = "Telescope",
      config = telescope.media,
    })
    use({
      "LinArcX/telescope-env.nvim",
      after = "telescope.nvim",
      cmd = "Telescope",
      config = telescope.env,
    })

    local ts = require("plugins.ts")
    use({
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      event = "BufRead",
      config = ts.treesitter,
    })
    use({
      "nvim-treesitter/nvim-treesitter-textobjects",
      after = "nvim-treesitter",
      requires = { "nvim-treesitter/nvim-treesitter" },
      config = ts.textobjects,
    })
    use({
      "p00f/nvim-ts-rainbow",
      after = "nvim-treesitter",
      requires = { "nvim-treesitter/nvim-treesitter" },
    })
    use({
      "JoosepAlviste/nvim-ts-context-commentstring",
      after = "nvim-treesitter",
      requires = { "nvim-treesitter/nvim-treesitter" },
    })
    use({
      "nvim-treesitter/nvim-treesitter-context",
      requires = { "nvim-treesitter/nvim-treesitter" },
      after = "nvim-treesitter",
      config = ts.context,
    })
    use({
      "windwp/nvim-ts-autotag",
      after = "nvim-treesitter",
      requires = { "nvim-treesitter/nvim-treesitter" },
    })
    use({
      "kylechui/nvim-surround",
      tag = "*",
      after = "nvim-treesitter",
      config = ts.surround,
    })
    use({
      "lewis6991/spellsitter.nvim",
      after = "nvim-treesitter",
      config = ts.spellsitter,
    })

    local utils = require("plugins.utils")
    use({
      "michaelb/sniprun",

      cmd = { "SnipRun", "'<,'>SnipRun" },
      run = "bash install.sh",
      config = utils.sniprun,
    })
    use({
      "akinsho/toggleterm.nvim",

      event = "UIEnter",
      config = utils.toggleterm,
    })
    use({
      "stevearc/aerial.nvim",
      after = "nvim-lspconfig",
      config = utils.aerial,
    })
    use({ "ellisonleao/glow.nvim", branch = "main", config = utils.glow })
    use({
      "folke/which-key.nvim",
      config = utils.which_key,
      after = "legendary.nvim",
    })
    use({ "mrjones2014/legendary.nvim" })
    use({
      "iamcco/markdown-preview.nvim",
      ft = "markdown",
      run = "cd app && pnpm install",
    })
    use({ "jghauser/mkdir.nvim" })
    use({
      "rcarriga/nvim-notify",
      after = "telescope.nvim",
      config = utils.notify,
    })
    use({ "is0n/jaq-nvim", config = utils.jaq })
    use({
      "lewis6991/gitsigns.nvim",
      event = { "BufReadPost", "BufNewFile" },
      tag = "release",
      config = utils.gitsigns,
    })
    use({
      "sindrets/diffview.nvim",
      cmd = "Diffview*",
      requires = "nvim-lua/plenary.nvim",
      config = utils.diffview,
    })
    use({
      "TimUntersberger/neogit",
      cmd = "Neogit",
      requires = "nvim-lua/plenary.nvim",
      config = utils.neogit,
    })
    use({
      "Shatur/neovim-session-manager",
      cmd = "SessionManager",
      config = utils.session_manager,
    })
    use({
      "sbdchd/neoformat",
      cmd = "Neoformat",
      config = utils.neoformat,
    })
    use({
      "gpanders/editorconfig.nvim",
      -- event = "InsertEnter",
      config = utils.editorconfig,
    })
    use({
      "ahmedkhalf/project.nvim",
      after = "nvim-tree.lua",
      config = utils.project,
    })
    use({
      "kevinhwang91/nvim-bqf",
      ft = "qf",
      config = utils.bqf,
    })
    use({
      "kevinhwang91/rnvimr",
      cmd = "Rnvimr*",
      config = utils.rnvimr,
    })
    use({
      "ldelossa/litee.nvim",
      requires = {
        "ldelossa/litee-calltree.nvim",
        "ldelossa/litee-symboltree.nvim",
        "ldelossa/litee-filetree.nvim",
        "ldelossa/litee-bookmarks.nvim",
      },
      cmd = "LT*",
      config = utils.litee,
    })
    use({ "nathom/filetype.nvim", config = utils.filetype })
    use({
      "black-desk/fcitx5-ui.nvim",
      after = "lualine.nvim",
      rocks = { "lgi", "dbus_proxy" },
      config = utils.fcitx_ui,
    })
    use({ "aserowy/tmux.nvim", config = utils.tmux })
    use({
      "gennaro-tedesco/nvim-jqx",
      ft = "json",
      config = utils.jqx,
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
      config = utils.neotest,
    })
    use({
      "folke/zen-mode.nvim",
      cmd = "ZenMode",
      config = utils.zen,
    })
    use({ "tversteeg/registers.nvim", config = utils.registers })
    use({ "ThePrimeagen/harpoon", config = utils.harpoon })
    use({ "jbyuki/venn.nvim", cmd = "VBox*", config = utils.venn })
    use({
      "folke/todo-comments.nvim",
      after = "nvim-treesitter",
      event = "BufReadPost",
      requires = "nvim-lua/plenary.nvim",
      config = utils.todo_comments,
    })
    use({
      "nvim-neorg/neorg",
      ft = "norg",
      after = "nvim-treesitter",
      config = utils.neorg,
      requires = "nvim-lua/plenary.nvim",
    })

    local dap = require("plugins.dap")
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
      config = dap.dap,
    })
    use({
      "rcarriga/nvim-dap-ui",
      after = "nvim-dap",
      config = dap.dap_ui,
    })
    use({
      "theHamsta/nvim-dap-virtual-text",
      after = "nvim-dap",
      config = dap.virtual_text,
    })

    local lang = require("plugins.lang")
    use({ "mfussenegger/nvim-jdtls", ft = "java", config = lang.jdtls })
    use({
      "simrat39/rust-tools.nvim",
      config = lang.rust_tools,
    })
    use({
      "saecki/crates.nvim",
      event = { "BufRead Cargo.toml" },
      requires = { { "nvim-lua/plenary.nvim" } },
      config = lang.crates,
    })
    use({
      "vuki656/package-info.nvim",
      event = { "BufRead package.json" },
      requires = "MunifTanjim/nui.nvim",
      config = lang.package_info,
    })

    use({ "nvim-lua/popup.nvim" })

    if packer_bootstrap then
      require("packer").sync()
    end
  end,

  config = {
    display = {
      open_fn = function()
        return require("packer.util").float({ border = "single" })
      end,
    },
    git = {
      cmd = "git",
      default_url_format = "https://github.com/%s",
    },
  },
})

if packer_bootstrap then
  print("Please wait and then restart nvim.")
  return
end
