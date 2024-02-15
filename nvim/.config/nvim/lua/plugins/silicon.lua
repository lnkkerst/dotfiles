return {
  {
    "krivahtoo/silicon.nvim",
    enabled = false,
    build = "./install.sh build",
    config = function()
      require("silicon").setup({
        font = "JetbrainsMono NF",
        theme = "Catppuccin-mocha",
        line_number = true,
        output = {
          clipboard = true,
        },
      })
    end,
  },
}
