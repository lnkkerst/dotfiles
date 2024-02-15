return {
  {
    "RRethy/vim-illuminate",
    config = function()
      require("illuminate").configure({
        providers = {
          "lsp",
          "treesitter",
          "regex",
        },
        delay = 300,
        filetypes_denylist = {
          "dashboard",
          "NvimTree",
        },
      })
    end,
  },
}
