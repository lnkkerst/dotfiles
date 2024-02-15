return {
  {
    "lvimuser/lsp-inlayhints.nvim",
    config = function()
      local inlayhints = require("lsp-inlayhints")

      inlayhints.setup({
        enabled_at_startup = false,
      })

      vim.api.nvim_create_user_command(
        "InlayhintsToggle",
        inlayhints.toggle,
        {}
      )
    end,
    -- branch = "anticonceal",
  },
}
