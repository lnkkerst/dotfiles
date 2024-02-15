return {
  {
    "kyazdani42/nvim-tree.lua",
    -- cmd = "NvimTreeToggle",
    dependencies = {
      "kyazdani42/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup({
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
      })
    end,
  },
}
