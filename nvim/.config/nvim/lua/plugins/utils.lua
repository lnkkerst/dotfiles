return {
  {
    "akinsho/toggleterm.nvim",
    enabled = vim.g.default_terminal == "toggleterm",
    keys = { [[<C-\>]] },
    cmd = { "Ranger", "FloatTerm" },
    config = function()
      require("toggleterm").setup({
        open_mapping = [[<C-\>]],
        shade_terminals = false,
        start_in_insert = true,
        insert_mappings = true,
        terminal_mappings = true,
        float_opts = {
          border = "single",
        },
      })

      local set_terminal_keymaps = function()
        if vim.g.vscode then
          return
        end

        local opts = { buffer = 0 }
        vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
        -- vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
        vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
        vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
        vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
        vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
      end
      -- if you only want these mappings for toggle term use term://*toggleterm#* instead
      vim.api.nvim_create_autocmd("TermOpen", {
        pattern = "term://*",
        callback = set_terminal_keymaps,
      })

      vim.keymap.set({ "n" }, "gs", '<cmd>TermExec cmd="cd %:p:h"<cr>')

      local Terminal = require("toggleterm.terminal").Terminal

      -- local lazygit = Terminal:new({
      --   cmd = "lazygit",
      --   hidden = true,
      --   direction = "float",
      -- })
      -- vim.api.nvim_create_user_command("Lazygit", function()
      --   lazygit:toggle()
      -- end, {})

      local floatterm = Terminal:new({
        hidden = true,
        direction = "float",
      })
      vim.api.nvim_create_user_command("FloatTerm", function()
        floatterm:toggle()
      end, { desc = "Open a float terminal with toggleterm" })
      vim.keymap.set({ "n", "i" }, [[<C-A-\>]], function()
        floatterm:toggle()
      end, { desc = "Open float term" })

      local ranger = Terminal:new({
        cmd = "ranger",
        hidden = true,
        direction = "float",
      })
      vim.api.nvim_create_user_command("Ranger", function()
        ranger:toggle()
      end, { desc = "Open ranger with toggleterm" })
    end,
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    vscode = true,
    opts = {
      icons = {
        mappings = false,
      },
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },

  {
    "folke/trouble.nvim",
    enabled = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = "Trouble",
    opts = {},
    keys = {
      {
        "<A-t>",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Toggle Trouble diagnostics",
      },
    },
  },

  {
    "aserowy/tmux.nvim",
    -- event = "VeryLazy",
    keys = {
      {
        "<M-up>",
        function()
          require("tmux").resize_top()
        end,
        mode = { "n", "t" },
      },
      {
        "<M-down>",
        function()
          require("tmux").resize_bottom()
        end,
        mode = { "n", "t" },
      },
      {
        "<M-left>",
        function()
          require("tmux").resize_left()
        end,
        mode = { "n", "t" },
      },
      {
        "<M-right>",
        function()
          require("tmux").resize_right()
        end,
        mode = { "n", "t" },
      },
      {
        "<C-h>",
        function()
          require("tmux").move_left()
        end,
        mode = { "t", "n" },
      },
      {
        "<C-j>",
        function()
          require("tmux").move_bottom()
        end,
        mode = { "t", "n" },
      },
      {
        "<C-k>",
        function()
          require("tmux").move_top()
        end,
        mode = { "t", "n" },
      },
      {
        "<C-l>",
        function()
          require("tmux").move_right()
        end,
        mode = { "t", "n" },
      },
    },
    opts = {
      copy_sync = {
        enable = false,
      },
      navigation = {
        enable_default_keybindings = true,
        cycle_navigation = true,
      },
      resize = {
        enable_default_keybindings = false,
      },
    },
  },

  {
    "ahmedkhalf/project.nvim",
    event = "VeryLazy",
    name = "project_nvim",
    opts = {
      manual_mode = true,
      ignore_lsp = { "null-ls", "copilot", "typos_lsp" },
    },
  },

  {
    "folke/todo-comments.nvim",
    enabled = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "LazyFile",
    opts = {},
  },

  {
    "uga-rosa/ccc.nvim",
    event = "VeryLazy",
    opts = {
      highlighter = {
        auto_enable = true,
        lsp = false,
        update_insert = false,
      },
      lsp = false,
      win_opts = {
        border = "single",
      },
    },
  },

  {
    "stevearc/aerial.nvim",
    enabled = false,
    cmd = {
      "AerialToggle",
      "AerialGo",
      "AerialInfo",
      "AerialNavToggle",
      "AerialNext",
      "AerialPrev",
      "AerialOpen",
      "AerialClose",
      "AerialNavOpen",
      "AerialNavClose",
      "AerialOpenAll",
      "AerialCloseAll",
    },
    keys = {
      {
        "<A-a>",
        "<cmd>AerialToggle<cr>",
        desc = "Toggle Aerial",
      },
    },
    opts = {},
  },

  {
    "danymat/neogen",
    cmd = "Neogen",
    opts = {},
  },

  {
    "ThePrimeagen/refactoring.nvim",
    cmd = { "Refactor" },
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-treesitter/nvim-treesitter" },
    },
    opts = {},
  },
}
