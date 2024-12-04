return {
  {
    "akinsho/toggleterm.nvim",
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
    "krivahtoo/silicon.nvim",
    enabled = true,
    build = "./install.sh build",
    cmd = "Silicon",
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
    "folke/zen-mode.nvim",
    cmd = { "ZenMode" },
    keys = {
      {
        "<M-f>",
        function()
          require("zen-mode").toggle()
        end,
        "Toggle zen mode",
      },
    },
    opts = {
      window = {
        width = 0.9,
        height = 1,
      },
      plugins = {
        twilight = { enabled = false },
      },
    },
  },

  {
    "folke/trouble.nvim",
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
    opts = {
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
    },
  },

  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup({
        manual_mode = true,
        ignore_lsp = { "null-ls" },
      })
    end,
  },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },

  {
    "uga-rosa/ccc.nvim",
    event = "VeryLazy",
    opts = {
      highlighter = {
        auto_enable = true,
        lsp = true,
      },
    },
  },
}
