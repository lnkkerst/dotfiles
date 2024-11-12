return {
  {
    "rcarriga/nvim-notify",
    opts = {
      -- level = "info",
      stages = "static",
      render = "minimal",
      timeout = 1500,
      background_colour = "Normal",
      minimum_width = 36,
      icons = {
        ERROR = "",
        WARN = "",
        INFO = "",
        DEBUG = "",
        TRACE = "✎",
      },
    },
    config = function(_, opts)
      local notify = require("notify")
      notify.setup(opts)

      vim.notify = notify
    end,
  },
}
