return {
  {
    "michaelb/sniprun",
    cmd = { "SnipRun" },
    build = "bash install.sh",
    opts = {},
  },

  {
    "stevearc/overseer.nvim",
    cmd = {
      "OverseerRun",
      "OverseerInfo",
      "OverseerOpen",
      "OverseerBuild",
      "OverseerClose",
      "OverseerRunCmd",
      "OverseerToggle",
      "OverseerCleanCache",
      "OverseerLoadBundle",
      "OverseerSaveBundle",
      "OverseerTaskAction",
      "OverseerQuickAction",
      "OverseerDeleteBundle",
    },
    config = function()
      local overseer = require("overseer")
      overseer.setup({
        templates = { "builtin" },
      })

      overseer.register_template({
        name = "g++ build",
        builder = function()
          -- Full path to current file (see :help expand())
          local file = vim.fn.expand("%:p")
          return {
            cmd = { "g++" },
            args = { file },
            components = { { "on_output_quickfix", open = true }, "default" },
          }
        end,
        condition = {
          filetype = { "cpp" },
        },
      })
    end,
  },

  {
    "skywind3000/asyncrun.vim",
    cmd = { "AsyncRun", "AsyncStop", "AsyncReset" },
    init = function()
      vim.g.asyncrun_open = 6
    end,
  },
}
