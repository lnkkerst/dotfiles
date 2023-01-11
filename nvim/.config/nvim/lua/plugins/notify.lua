local notify = require("notify")
notify.setup({
  level = "info",
  stages = "static",
  render = "minimal",
  timeout = 1500,
  background_colour = "Normal",
  minimum_width = 50,
  icons = {
    ERROR = "",
    WARN = "",
    INFO = "",
    DEBUG = "",
    TRACE = "✎",
  },
})

vim.notify = notify
