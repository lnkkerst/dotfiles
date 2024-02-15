return {
  {
    "aserowy/tmux.nvim",
    config = function()
      require("tmux").setup({
        copy_sync = {
          enable = false,
        },
        navigation = {
          enable_default_keybindings = true,
          cycle_navigation = true,
        },
        resize = {
          enable_default_keybindings = true,
        },
      })
    end,
    cond = not vim.g.vscode,
  },
}
