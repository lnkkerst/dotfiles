return {
  {
    "simrat39/rust-tools.nvim",
    enabled = false,
    lazy = true,
    ft = "rust",
  },

  {
    "mrcjkb/rustaceanvim",
    version = "^4", -- Recommended
    lazy = false, -- This plugin is already lazy
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
    "folke/neodev.nvim",
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
}
