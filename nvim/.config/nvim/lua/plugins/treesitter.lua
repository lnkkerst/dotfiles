-- Treesitter
require("nvim-treesitter.configs").setup({
  -- ensure_installed = "all",

  sync_install = false,

  -- ignore_install = { "phpdoc" },

  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
    disable = function(_, buf)
      local max_filesize = 10 * 1024
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_filesize then
        return true
      end
    end,
  },

  indent = {
    enable = true,
  },

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = false,
      node_incremental = "]n",
      node_decremental = "[n",
    },
  },
})

-- Textobjects
require("nvim-treesitter.configs").setup({
  textobjects = {
    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = {
        ["]m"] = {
          query = "@function.outer",
          desc = "Next function start",
        },
        ["]c"] = {
          query = "@class.outer",
          desc = "Next class start",
        },
        ["]l"] = {
          query = "@loop.outer",
          desc = "Next loop start",
        },
        ["]p"] = {
          query = "@parameter.outer",
          desc = "Next paramter start",
        },
        ["]a"] = {
          query = "@attribute.outer",
          desc = "Next attribute start",
        },
      },
      goto_next_end = {
        ["]M"] = {
          query = "@function.outer",
          desc = "Next function end",
        },
        ["]C"] = {
          query = "@class.outer",
          desc = "Next class end",
        },
        ["]L"] = {
          query = "@loop.outer",
          desc = "Next loop end",
        },
        ["]P"] = {
          query = "@parameter.outer",
          desc = "Next paramter end",
        },
        ["]A"] = {
          query = "@attribute.outer",
          desc = "Next attribute end",
        },
      },
      goto_previous_start = {
        ["[m"] = {
          query = "@function.outer",
          desc = "Previous function start",
        },
        ["[c"] = {
          query = "@class.outer",
          desc = "Previous class start",
        },
        ["[l"] = {
          query = "@loop.outer",
          desc = "Previous loop start",
        },
        ["[p"] = {
          query = "@parameter.outer",
          desc = "Previous paramter start",
        },
        ["[a"] = {
          query = "@attribute.outer",
          desc = "Previous attribute start",
        },
      },
      goto_previous_end = {
        ["[M"] = {
          query = "@function.outer",
          desc = "Previous function end",
        },
        ["[C"] = {
          query = "@class.outer",
          desc = "Previous class end",
        },
        ["[L"] = {
          query = "@loop.outer",
          desc = "Previous loop end",
        },
        ["[P"] = {
          query = "@parameter.outer",
          desc = "Previous paramter end",
        },
        ["[A"] = {
          query = "@attribute.outer",
          desc = "Previous attribute end",
        },
      },
    },

    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = {
          query = "@function.outer",
          desc = "outer part of a function region",
        },
        ["if"] = {
          query = "@function.inner",
          desc = "inner part of a function region",
        },
        ["ac"] = {
          query = "@class.outer",
          desc = "outer part of a class region",
        },
        ["ic"] = {
          query = "@class.inner",
          desc = "inner part of a class region",
        },
      },
      -- If you set this to `true` (default is `false`) then any textobject is
      -- extended to include preceding xor succeeding whitespace. Succeeding
      -- whitespace has priority in order to act similarly to eg the built-in
      -- `ap`.
      include_surrounding_whitespace = true,
    },

    swap = {
      enable = true,
      swap_next = {
        ["<leader>a"] = "@parameter.inner",
      },
      swap_previous = {
        ["<leader>A"] = "@parameter.inner",
      },
    },
  },
})

require("ts_context_commentstring").setup({})

-- Autotag
require("nvim-treesitter.configs").setup({
  autotag = {
    enable = true,
  },
})

-- textsubjects
require("nvim-treesitter.configs").setup({
  textsubjects = {
    enable = true,
    prev_selection = ",", -- (Optional) keymap to select the previous selection
    keymaps = {
      ["<cr>"] = "textsubjects-smart",
      [";"] = "textsubjects-container-outer",
      ["i;"] = "textsubjects-container-inner",
    },
  },
})

-- refactor
require("nvim-treesitter.configs").setup({
  refactor = {
    highlight_current_scope = { enable = false },
  },
})

-- context
require("treesitter-context").setup({})

-- matchup
require("nvim-treesitter.configs").setup({
  matchup = {
    enable = true,
  },
})
