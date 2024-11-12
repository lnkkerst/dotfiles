return {
  {
    "dpayne/CodeGPT.nvim",
    cmd = { "Chat", "CodeGPTStatus" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    init = function()
      vim.g["codegpt_commands"] = {
        ["doc"] = {
          model = "gpt-3.5-turbo-16k",
          max_tokens = 16384,
        },
      }
    end,
    config = function()
      require("codegpt.config")
    end,
  },
}
