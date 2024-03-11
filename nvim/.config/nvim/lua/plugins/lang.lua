return {
  {
    "simrat39/rust-tools.nvim",
    lazy = true,
    ft = "rust",
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
}
