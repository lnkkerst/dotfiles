return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = vim.g.default_file_explorer == "neo-tree",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    keys = {
      {
        "<C-n>",
        "<cmd>Neotree toggle<cr>",
        desc = "Toggle neo-tree file explorer",
      },
    },
    opts = {
      popup_border_style = "single",
      filesystem = {
        follow_current_file = {
          enabled = true,
        },
      },
    },
  },

  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    keys = {
      { "<leader>o", "<cmd>Oil<cr>", desc = "Open oil" },
    },
    opts = {
      columns = {
        "icon",
        "permissions",
        "size",
        "mtime",
      },
      keymaps = {
        ["<C-s>"] = false,
        ["<C-v>"] = { "actions.select", opts = { vertical = true } },
        ["<C-p>"] = false,
        ["gp"] = "actions.preview",
      },
      float = {
        border = "single",
      },
      confirmation = {
        border = "single",
      },
      progress = {
        border = "single",
      },
      ssh = {
        border = "single",
      },
      keymaps_help = {
        border = "single",
      },
    },
  },

  {
    "kyazdani42/nvim-tree.lua",
    enabled = vim.g.default_file_explorer == "nvim-tree",
    cmd = "NvimTreeToggle",
    dependencies = {
      "kyazdani42/nvim-web-devicons",
    },
    keys = {
      {
        "<C-n>",
        "<cmd>NvimTreeToggle<cr>",
        desc = "NvimTreeToggle",
      },
    },
    opts = {
      auto_reload_on_write = true,
      sync_root_with_cwd = true,
      respect_buf_cwd = true,
      update_focused_file = {
        enable = true,
        update_root = true,
      },

      renderer = {
        icons = {
          glyphs = {
            git = {
              unstaged = "",
              staged = "",
              unmerged = "",
              renamed = "➜",
              untracked = "",
              deleted = "",
              ignored = "◌",
            },
          },
        },
      },
    },
  },
}
