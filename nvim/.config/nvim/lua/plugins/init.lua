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

    local ui = require("plugins.ui")
    use({ "catppuccin/nvim", as = "catppuccin", config = ui.catppuccin })
    use({ "folke/tokyonight.nvim", config = ui.tokyonight })
    use({ "sainnhe/gruvbox-material", config = ui.gruvbox_material })
    use({ "marko-cerovac/material.nvim", config = ui.material })
    use({ "tomasiser/vim-code-dark" })
    use({ "shaunsingh/nord.nvim", config = ui.nord })
    use({
      "nvim-lualine/lualine.nvim",
      requires = { "kyazdani42/nvim-web-devicons", opt = true },
      config = ui.lualine,
    })
    use({
      "SmiteshP/nvim-navic",
      requires = "neovim/nvim-lspconfig",
      config = ui.navic,
    })
    use({
      "akinsho/bufferline.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = ui.bufferline,
    })
    use({ "glepnir/dashboard-nvim", config = ui.dashboard })
    use({ "lukas-reineke/indent-blankline.nvim", config = ui.indent_blankline })
    use({
      "kyazdani42/nvim-tree.lua",
      requires = {
        "kyazdani42/nvim-web-devicons", -- optional, for file icon
      },
      config = ui.tree,
    })
    use({ "xiyaowong/nvim-transparent", config = ui.transparent })
    use({ "petertriho/nvim-scrollbar", config = ui.scrollbar })
    use({ "beauwilliams/focus.nvim", config = ui.focus })
    use({
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = ui.trouble,
    })
    use({ "sidebar-nvim/sidebar.nvim", config = ui.sidebar })
    use({ "stevearc/dressing.nvim", config = ui.dressing })

    local editor = require("plugins.editor")
    use({ "rainbowhxch/accelerated-jk.nvim", config = editor.accelerated_jk })
    use({ "xiyaowong/nvim-cursorword", config = editor.cursorword })
    use({ "windwp/nvim-autopairs", config = editor.autopairs })
    use({ "numToStr/Comment.nvim", config = editor.comment })
    use({ "phaazon/hop.nvim", branch = "v1", config = editor.hop })
    use({ "kevinhwang91/nvim-hlslens", config = editor.hlslens })
    -- use { "karb94/neoscroll.nvim", config = editor.neoscroll }
    -- use {"haringsrob/nvim_context_vt", config = editor.context_vt}
    -- use { "edluffy/specs.nvim", config = editor.specs }
    -- use({ "Pocco81/AutoSave.nvim", config = editor.autosave })
    use({ "mizlan/iswap.nvim", config = editor.iswap })
    use({ "ethanholz/nvim-lastplace", config = editor.lastplace })
    use({ "nacro90/numb.nvim", config = editor.numb })
    use({
      "danymat/neogen",
      requires = { "nvim-treesitter/nvim-treesitter" },
      config = editor.neogen,
    })
    -- use { "abecodes/tabout.nvim", config = editor.tabout }
    use({ "max397574/better-escape.nvim", config = editor.better_escape })
    use({ "norcalli/nvim-colorizer.lua", config = editor.colorizer })
    use({
      "kevinhwang91/nvim-ufo",
      requires = "kevinhwang91/promise-async",
      config = editor.ufo,
    })
    --
    local lsp = require("plugins.lsp")
    use({ "neovim/nvim-lspconfig", config = lsp.lspconfig })
    use({ "williamboman/mason.nvim", config = lsp.mason })
    use({ "williamboman/mason-lspconfig.nvim", config = lsp.mason_lspconfig })
    use({ "glepnir/lspsaga.nvim", config = lsp.lspsaga })
    use({ "j-hui/fidget.nvim", config = lsp.fidget })
    use({ "folke/lsp-colors.nvim", config = lsp.lsp_colors })
    use({ "b0o/schemastore.nvim" })
    use({ "simrat39/symbols-outline.nvim", config = lsp.symbols_outline })
    use({ "jubnzv/virtual-types.nvim", config = lsp.virtual_types })
    use({ "p00f/clangd_extensions.nvim" })
    use({ "folke/lua-dev.nvim" })
    use({
      "junnplus/nvim-lsp-setup",
      requires = {
        "neovim/nvim-lspconfig",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
      },
      config = lsp.lsp_setup,
    })
    use({
      "jose-elias-alvarez/null-ls.nvim",
      requires = { "nvim-lua/plenary.nvim" },
      config = lsp.null,
    })
    use({
      "amrbashir/nvim-docs-view",
      opt = true,
      cmd = { "DocsViewToggle" },
      config = lsp.docs_view,
    })

    local cmp = require("plugins.cmp")
    use({ "hrsh7th/nvim-cmp", config = cmp.cmp })
    use({ "hrsh7th/cmp-nvim-lsp" })
    use({ "hrsh7th/cmp-buffer" })
    use({ "hrsh7th/cmp-path" })
    use({ "hrsh7th/cmp-cmdline" })
    use({ "f3fora/cmp-spell" })
    use({ "lukas-reineke/cmp-under-comparator" })
    use({ "hrsh7th/cmp-nvim-lsp-document-symbol" })
    use({ "hrsh7th/cmp-nvim-lsp-signature-help" })
    use({ "mtoohey31/cmp-fish" })
    use({
      "petertriho/cmp-git",
      requires = "nvim-lua/plenary.nvim",
      config = cmp.git,
    })
    use({ "andersevenrud/cmp-tmux" })
    use({
      "David-Kunz/cmp-npm",
      requires = {
        "nvim-lua/plenary.nvim",
      },
    })
    use({ "onsails/lspkind.nvim" })
    use({
      "saadparwaiz1/cmp_luasnip",
      requires = {
        { "L3MON4D3/LuaSnip", config = cmp.luasnip },
        { "rafamadriz/friendly-snippets" },
      },
    })
    use({ "ray-x/cmp-treesitter" })
    use({ "hrsh7th/cmp-nvim-lua" })
    use({ "hrsh7th/cmp-calc" })
    use({ "hrsh7th/cmp-omni" })
    use({ "hrsh7th/cmp-emoji" })
    use({ "dmitmel/cmp-cmdline-history", config = cmp.cmdline_history })

    local fzf = require("plugins.fzf")
    use({
      "nvim-telescope/telescope.nvim",
      requires = { { "nvim-lua/plenary.nvim" } },
      config = fzf.telescope,
    })
    use({
      "nvim-telescope/telescope-fzy-native.nvim",
      run = "make",
      config = ui.telescope_fzf_native,
    })
    use({
      "AckslD/nvim-neoclip.lua",
      requires = { "tami5/sqlite.lua", module = "sqlite" },
      config = fzf.neoclip,
    })
    use({
      "nvim-telescope/telescope-file-browser.nvim",
      config = fzf.file_browser,
    })
    use({ "nvim-telescope/telescope-packer.nvim", config = fzf.packer })
    use({ "nvim-telescope/telescope-symbols.nvim", config = fzf.symbols })
    use({ "nvim-telescope/telescope-github.nvim", config = fzf.github })
    use({
      "nvim-telescope/telescope-frecency.nvim",
      requires = { "tami5/sqlite.lua" },
      config = fzf.frecency,
    })

    local ts = require("plugins.ts")
    use({
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      config = ts.treesitter,
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
      config = ts.context,
    })
    use({
      "windwp/nvim-ts-autotag",
      requires = { "nvim-treesitter/nvim-treesitter" },
    })

    local utils = require("plugins.utils")
    use({ "michaelb/sniprun", run = "bash install.sh", config = utils.sniprun })
    use({ "akinsho/toggleterm.nvim", config = utils.toggleterm })
    use({ "stevearc/aerial.nvim", config = utils.aerial })
    use({ "ellisonleao/glow.nvim", branch = "main", config = utils.glow })
    use({ "folke/which-key.nvim", config = utils.which_key })
    use({ "iamcco/markdown-preview.nvim", run = "cd app && pnpm install" })
    use({ "jghauser/mkdir.nvim" })
    use({ "rcarriga/nvim-notify", config = utils.notify })
    use({ "is0n/jaq-nvim", config = utils.jaq })
    use({ "lewis6991/gitsigns.nvim", tag = "release", config = utils.gitsigns })
    use({
      "TimUntersberger/neogit",
      requires = "nvim-lua/plenary.nvim",
      config = utils.neogit,
    })
    use({ "Shatur/neovim-session-manager", config = utils.session_manager })
    use({ "sbdchd/neoformat", config = utils.neoformat })
    use({ "gpanders/editorconfig.nvim", config = utils.editorconfig })
    use({ "ahmedkhalf/project.nvim", config = utils.project })
    use({ "kevinhwang91/nvim-bqf", ft = "qf", config = utils.bqf })
    use({ "kevinhwang91/rnvimr", config = utils.rnvimr })
    use({
      "ldelossa/litee.nvim",
      requires = {
        "ldelossa/litee-calltree.nvim",
        "ldelossa/litee-symboltree.nvim",
        "ldelossa/litee-filetree.nvim",
        "ldelossa/litee-bookmarks.nvim",
      },
      config = utils.litee,
    })
    use({ "nathom/filetype.nvim", config = utils.filetype })
    use({
      "CRAG666/code_runner.nvim",
      requires = "nvim-lua/plenary.nvim",
      config = utils.code_runner,
    })
    use({
      "black-desk/fcitx5-ui.nvim",
      rocks = { "lgi", "dbus_proxy" },
      config = utils.fcitx_ui,
    })
    -- use { "hkupty/nvimux", config = utils.nvimux }
    use({ "aserowy/tmux.nvim", config = utils.tmux })
    use({
      "nvim-neotest/neotest",
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
      config = utils.zen,
    })

    local dap = require("plugins.dap")
    use({ "mfussenegger/nvim-dap", config = dap.dap })
    use({ "rcarriga/nvim-dap-ui", config = dap.dap_ui })
    use({ "theHamsta/nvim-dap-virtual-text", config = dap.virtual_text })

    local lang = require("plugins.lang")
    use({ "mfussenegger/nvim-jdtls", config = lang.jdtls })
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
      requires = "MunifTanjim/nui.nvim",
      config = lang.package_info,
    })
    use({ "jose-elias-alvarez/typescript.nvim", config = lang.typescript })

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
