return {
  {
    "kevinhwang91/nvim-bqf",
    enabled = true,
    ft = "qf",
    dependencies = {
      {
        "junegunn/fzf",
      },
    },
    opts = {
      preview = {
        border = "single",
      },
    },
  },
  {
    "stevearc/quicker.nvim",
    enabled = false,
    ft = "qf",
    ---@module "quicker"
    ---@type quicker.SetupOptions
    opts = {},
  },
}
