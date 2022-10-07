local ts = {}

ts.treesitter = function()
  -- vim.api.nvim_command("set foldmethod=expr")
  -- vim.api.nvim_command("set foldexpr=nvim_treesitter#foldexpr()")

  require("nvim-treesitter.configs").setup({
    ensure_installed = "all",

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- List of parsers to ignore installing (for "all")
    ignore_install = { "phpdoc" },

    auto_install = true,

    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
      disable = false,
    },

    rainbow = {
      enable = true,
      extended_mode = true, -- highlight also non-parentheses delimiters, boolean or table: lang -> boolean
      max_file_lines = 1000, -- do not enable for files with more than 1000 lines, int
    },

    autotag = {
      enable = true,
    },

    context_commentstring = {
      enable = true,
      enable_autocmd = false,
    },
  })
end

ts.textobjects = function()
  require("nvim-treesitter.configs").setup({
    textobjects = {
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          ["]m"] = "@function.outer",
          ["]]"] = "@class.outer",
        },
        goto_next_end = {
          ["]M"] = "@function.outer",
          ["]["] = "@class.outer",
        },
        goto_previous_start = {
          ["[m"] = "@function.outer",
          ["[["] = "@class.outer",
        },
        goto_previous_end = {
          ["[M"] = "@function.outer",
          ["[]"] = "@class.outer",
        },
      },
      select = {
        enable = true,

        -- Automatically jump forward to textobj, similar to targets.vim
        lookahead = true,

        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          -- you can optionally set descriptions to the mappings (used in the desc parameter of nvim_buf_set_keymap
          ["ic"] = {
            query = "@class.inner",
            desc = "Select inner part of a class region",
          },
        },
        -- You can choose the select mode (default is charwise 'v')
        selection_modes = {
          ["@parameter.outer"] = "v", -- charwise
          ["@function.outer"] = "V", -- linewise
          ["@class.outer"] = "<c-v>", -- blockwise
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
end

ts.context = function()
  require("treesitter-context").setup({
    enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
    max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
    trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
    patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
      -- For all filetypes
      -- Note that setting an entry here replaces all other patterns for this entry.
      -- By setting the 'default' entry below, you can control which nodes you want to
      -- appear in the context window.
      default = {
        "class",
        "function",
        "method",
        -- 'for', -- These won't appear in the context
        -- 'while',
        -- 'if',
        -- 'switch',
        -- 'case',
      },
      -- Example for a specific filetype.
      -- If a pattern is missing, *open a PR* so everyone can benefit.
      --   rust = {
      --       'impl_item',
      --   },
    },
    exact_patterns = {
      -- Example for a specific filetype with Lua patterns
      -- Treat patterns.rust as a Lua pattern (i.e "^impl_item$" will
      -- exactly match "impl_item" only)
      -- rust = true,
    },

    -- [!] The options below are exposed but shouldn't require your attention,
    --     you can safely ignore them.

    zindex = 20, -- The Z-index of the context window
    mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
  })
end

ts.surround = function()
  require("nvim-surround").setup()
end

ts.spellsitter = function()
  require("spellsitter").setup()
end

return ts
