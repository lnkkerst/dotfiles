return {
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup({
        manual_mode = true,
        ignore_lsp = { "null-ls" },
      })
    end,
  },
}
