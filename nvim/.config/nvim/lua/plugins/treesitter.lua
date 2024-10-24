return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
      { "nvim-treesitter/nvim-treesitter-textobjects" },
      { "JoosepAlviste/nvim-ts-context-commentstring" },
      { "nvim-treesitter/nvim-treesitter-context" },
      { "HiPhish/rainbow-delimiters.nvim" },
      { "windwp/nvim-ts-autotag" },
      { "kylechui/nvim-surround", version = "*", config = true },
      { "abecodes/tabout.nvim", config = true },
      { "andymass/vim-matchup" },
    },
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {},

        sync_install = false,

        ignore_install = { "phpdoc" },

        auto_install = true,

        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
          disable = function(lang, buf)
            local disabled_langs = { "vue" }
            if vim.tbl_contains(disabled_langs, lang) then
              return true
            end
            local max_filesize = 10 * 1024
            local ok, stats =
              pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
              return true
            end
          end,
        },

        indent = {
          enable = true,
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
                desc = "Next parameter start",
              },
              ["]a"] = {
                query = "@attribute.outer",
                desc = "Next attribute start",
              },
              ["]b"] = {
                query = "@block.outer",
                desc = "Next block start",
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
                desc = "Next parameter end",
              },
              ["]A"] = {
                query = "@attribute.outer",
                desc = "Next attribute end",
              },
              ["]B"] = {
                query = "@block.outer",
                desc = "Next block end",
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
                desc = "Previous parameter start",
              },
              ["[a"] = {
                query = "@attribute.outer",
                desc = "Previous attribute start",
              },
              ["[b"] = {
                query = "@block.outer",
                desc = "Previous block start",
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
                desc = "Previous parameter end",
              },
              ["[A"] = {
                query = "@attribute.outer",
                desc = "Previous attribute end",
              },
              ["[B"] = {
                query = "@block.outer",
                desc = "Previous block end",
              },
            },
          },

          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["af"] = {
                query = "@function.outer",
                desc = "function",
              },
              ["if"] = {
                query = "@function.inner",
                desc = "function",
              },
              ["ac"] = {
                query = "@class.outer",
                desc = "class",
              },
              ["ic"] = {
                query = "@class.inner",
                desc = "class",
              },
              ["ap"] = {
                query = "@parameter.outer",
                desc = "parameter",
              },
              ["ip"] = {
                query = "@parameter.inner",
                desc = "parameter",
              },
              ["al"] = {
                query = "@loop.outer",
                desc = "loop",
              },
              ["il"] = {
                query = "@loop.inner",
                desc = "loop",
              },
              ["aa"] = {
                query = "@attribute.outer",
                desc = "attribute",
              },
              ["ia"] = {
                query = "@attribute.inner",
                desc = "attribute",
              },
            },
            include_surrounding_whitespace = false,
          },

          swap = {
            enable = true,
            swap_next = {
              ["<leader>sp"] = "@parameter.inner",
              ["<leader>sa"] = "@attribute.inner",
            },
            swap_previous = {
              ["<leader>sP"] = "@parameter.inner",
              ["<leader>sA"] = "@attribute.inner",
            },
          },
        },
      })

      require("ts_context_commentstring").setup({})

      -- context
      require("treesitter-context").setup({})

      -- matchup
      require("nvim-treesitter.configs").setup({
        matchup = {
          enable = true,
        },
      })

      -- ts-auto-tag
      require("nvim-ts-autotag").setup({
        opts = {
          enable_close_on_slash = true,
        },
      })
    end,
  },
}
