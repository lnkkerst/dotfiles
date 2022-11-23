local ts = {}

ts.treesitter = function()
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

    indent = {
      enable = true,
    },
  })
end

ts.textobjects = function()
  require("nvim-treesitter.configs").setup({
    textobjects = {
      move = {
        enable = true,
        set_jumps = true,
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
          ["af"] = {
            query = "@function.outer",
            desc = "Select outer part of a class region",
          },
          ["if"] = {
            query = "@function.inner",
            desc = "Select inner part of a function",
          },
          ["ac"] = {
            query = "@class.outer",
            desc = "Select outer part of a class region",
          },
          ["ic"] = {
            query = "@class.inner",
            desc = "Select inner part of a class region",
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
end

ts.rainbow = function()
  require("nvim-treesitter.configs").setup({
    rainbow = {
      enable = true,
      extended_mode = true,
      max_file_lines = 2000,
    },
  })
end

ts.commentstring = function()
  require("nvim-treesitter.configs").setup({
    context_commentstring = {
      enable = true,
      enable_autocmd = false,
    },
  })
end

ts.context = function()
  require("treesitter-context").setup({
    enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
    max_lines = 2000, -- How many lines the window should span. Values <= 0 mean no limit.
    trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
    min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
    patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
      -- For all filetypes
      -- Note that setting an entry here replaces all other patterns for this entry.
      -- By setting the 'default' entry below, you can control which nodes you want to
      -- appear in the context window.
      default = {
        "class",
        "function",
        "method",
        "for",
        "while",
        "if",
        "switch",
        "case",
      },
      -- Patterns for specific filetypes
      -- If a pattern is missing, *open a PR* so everyone can benefit.
      tex = {
        "chapter",
        "section",
        "subsection",
        "subsubsection",
      },
      rust = {
        "impl_item",
        "struct",
        "enum",
      },
      scala = {
        "object_definition",
      },
      vhdl = {
        "process_statement",
        "architecture_body",
        "entity_declaration",
      },
      markdown = {
        "section",
      },
      elixir = {
        "anonymous_function",
        "arguments",
        "block",
        "do_block",
        "list",
        "map",
        "tuple",
        "quoted_content",
      },
      json = {
        "pair",
      },
      yaml = {
        "block_mapping_pair",
      },
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
    -- Separator between context and content. Should be a single character string, like '-'.
    -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
    separator = nil,
  })
end

ts.surround = function()
  require("nvim-surround").setup()
end

ts.autotag = function()
  require("nvim-treesitter.configs").setup({
    autotag = {
      enable = true,
    },
  })
end

return ts
