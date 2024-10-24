return {
  {
    "simrat39/rust-tools.nvim",
    enabled = false,
    lazy = true,
    ft = "rust",
  },

  {
    "mrcjkb/rustaceanvim",
    enabled = false,
    version = "^4", -- Recommended
    lazy = false, -- This plugin is already lazy
    config = function()
      local lsp_utils = require("utils.native_lsp")
      vim.g.rustaceanvim = {
        server = {
          on_attach = function(client, bufnr)
            lsp_utils.common_on_attach(client, bufnr)
            require("lsp-format").on_attach(client, bufnr)
          end,
          capabilities = lsp_utils.common_capabilities,
        },
      }
    end,
  },

  {
    "vxpm/ferris.nvim",
    enabled = true,
    opts = { create_commands = true },
  },

  {
    "mfussenegger/nvim-jdtls",
    lazy = true,
    ft = "java",
  },
  {
    "pmizio/typescript-tools.nvim",
    lazy = true,
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
  },
  {
    "folke/lazydev.nvim",
    opts = {},
    lazy = true,
    ft = "lua",
  },
  {
    "p00f/clangd_extensions.nvim",
    lazy = true,
    ft = "cpp",
  },
  {
    "linux-cultist/venv-selector.nvim",
    opts = {
      name = { "venv", ".venv" },
      parents = 0,
    },
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-telescope/telescope.nvim",
    },
    cmd = { "VenvSelect" },
  },

  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      local plugin_lsp = require("utils.native_lsp")
      require("go").setup({
        lsp_cfg = {
          capabilities = plugin_lsp.common_capabilities,
        },
      })
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  },
}
