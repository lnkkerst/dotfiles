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
      local max_filesize = 100 * 1024
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
        ["]f"] = {
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
        ["]F"] = {
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
        ["[f"] = {
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
        ["[F"] = {
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

-- Commentstring
require("nvim-treesitter.configs").setup({
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
})

-- Context
-- require("treesitter-context").setup({
--   enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
--   max_lines = 2000, -- How many lines the window should span. Values <= 0 mean no limit.
--   trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
--   min_window_height = 6, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
--   patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
--     -- For all filetypes
--     -- Note that setting an entry here replaces all other patterns for this entry.
--     -- By setting the 'default' entry below, you can control which nodes you want to
--     -- appear in the context window.
--     default = {
--       "class",
--       "function",
--       "method",
--       "for",
--       "while",
--       "if",
--       "switch",
--       "case",
--       "interface",
--       "struct",
--       "enum",
--     },
--     -- Patterns for specific filetypes
--     -- If a pattern is missing, *open a PR* so everyone can benefit.
--     tex = {
--       "chapter",
--       "section",
--       "subsection",
--       "subsubsection",
--     },
--     rust = {
--       "impl_item",
--       "struct",
--       "enum",
--     },
--     scala = {
--       "object_definition",
--     },
--     vhdl = {
--       "process_statement",
--       "architecture_body",
--       "entity_declaration",
--     },
--     markdown = {
--       "section",
--     },
--     elixir = {
--       "anonymous_function",
--       "arguments",
--       "block",
--       "do_block",
--       "list",
--       "map",
--       "tuple",
--       "quoted_content",
--     },
--     json = {
--       "pair",
--     },
--     yaml = {
--       "block_mapping_pair",
--     },
--   },
--   exact_patterns = {
--     -- Example for a specific filetype with Lua patterns
--     -- Treat patterns.rust as a Lua pattern (i.e "^impl_item$" will
--     -- exactly match "impl_item" only)
--     -- rust = true,
--   },
-- })

-- Autotag
require("nvim-treesitter.configs").setup({
  autotag = {
    enable = true,
  },
})

-- Rainbow
require("nvim-treesitter.configs").setup({
  rainbow = {
    enable = false,
    query = "rainbow-parens",
  },
})
