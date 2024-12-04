return {
  {
    "nvim-pack/nvim-spectre",
    dependencies = { { "nvim-lua/plenary.nvim" } },
    cmd = { "Spectre" },
    config = function() end,
  },

  {
    "kevinhwang91/nvim-hlslens",
    event = { "CmdlineEnter" },
    config = function()
      require("hlslens").setup({})
      local kopts = { noremap = true, silent = true }

      vim.api.nvim_set_keymap(
        "n",
        "n",
        [[<Cmd>execute("normal! " . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
        kopts
      )
      vim.api.nvim_set_keymap(
        "n",
        "N",
        [[<Cmd>execute("normal! " . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
        kopts
      )
      vim.api.nvim_set_keymap(
        "n",
        "*",
        [[*<Cmd>lua require('hlslens').start()<CR>]],
        kopts
      )
      vim.api.nvim_set_keymap(
        "n",
        "#",
        [[#<Cmd>lua require('hlslens').start()<CR>]],
        kopts
      )
      vim.api.nvim_set_keymap(
        "n",
        "g*",
        [[g*<Cmd>lua require('hlslens').start()<CR>]],
        kopts
      )
      vim.api.nvim_set_keymap(
        "n",
        "g#",
        [[g#<Cmd>lua require('hlslens').start()<CR>]],
        kopts
      )

      -- vim.api.nvim_set_keymap("n", "<Leader>l", ":noh<CR>", kopts)
    end,
  },

  {
    "cshuaimin/ssr.nvim",
    opts = {},
    keys = {
      {
        "<leader>sr",
        function()
          require("ssr").open()
        end,
        mode = { "n", "x" },
      },
    },
  },

  {
    "MagicDuck/grug-far.nvim",
    cmd = { "GrugFar" },
    opts = {},
  },
}
