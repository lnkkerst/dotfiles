return {
  -- rust
  {
    "mrcjkb/rustaceanvim",
    enabled = true,
    ft = { "rust" },
    config = function()
      local lsp_utils = require("utils.native_lsp")
      vim.g.rustaceanvim = {
        server = {
          on_attach = function(client, bufnr)
            lsp_utils.common_on_attach(client, bufnr)
            require("lsp-format").on_attach(client, bufnr)
          end,
          capabilities = lsp_utils.common_capabilities,
        },
      }
    end,
  },

  {
    "vxpm/ferris.nvim",
    enabled = false,
    opts = { create_commands = true },
  },

  {
    "Saecki/crates.nvim",
    event = "BufRead Cargo.toml",
    config = function()
      local crates = require("crates")

      crates.setup({
        null_ls = {
          enabled = true,
          name = "crates.nvim",
        },
        popup = {
          autofocus = true,
          border = "single",
        },
      })

      local commands = {
        ["toggle"] = crates.toggle,
        ["reload"] = crates.reload,
        ["show_features"] = crates.show_features_popup,
        ["show_versions"] = crates.show_versions_popup,
        ["show_dependencies"] = crates.show_dependencies_popup,
      }

      vim.api.nvim_create_user_command("Crates", function(args)
        commands[args.fargs[1]]()
      end, {
        desc = "Manage crates",
        nargs = "+",
        complete = function()
          return vim.tbl_keys(commands)
        end,
      })
    end,
  },

  -- java
  {
    "mfussenegger/nvim-jdtls",
    lazy = true,
    ft = "java",
  },

  -- web
  {
    "pmizio/typescript-tools.nvim",
    lazy = true,
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
  },

  -- lua
  {
    "folke/lazydev.nvim",
    opts = {
      library = {
        {
          path = "lazy.nvim",
          words = { "Lazy.*Spec" },
        },
      },
    },
    lazy = true,
    ft = "lua",
  },

  -- c/cpp
  {
    "p00f/clangd_extensions.nvim",
    lazy = true,
    ft = "cpp",
  },

  -- python
  {
    "linux-cultist/venv-selector.nvim",
    enabled = false,
    opts = {
      name = { "venv", ".venv" },
      parents = 0,
    },
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-telescope/telescope.nvim",
    },
    cmd = { "VenvSelect" },
  },
  {
    "AckslD/swenv.nvim",
    cmd = { "VenvS" },
    init = function()
      vim.api.nvim_create_user_command("VenvS", function()
        pcall(require, "fzf-lua")
        require("swenv.api").pick_venv()
      end, {})
    end,
    opts = function()
      return {
        venvs_path = vim.fn.expand("~/.virtualenvs"),
      }
    end,
  },

  -- go
  {
    "olexsmir/gopher.nvim",
    enabled = true,
    -- branch = "develop", -- if you want develop branch
    -- keep in mind, it might break everything
    ft = "go",
    cmd = { "GoInstallDeps" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "mfussenegger/nvim-dap", -- (optional) only if you use `gopher.dap`
    },

    -- (optional) will update plugin's deps on every update
    build = function()
      vim.cmd.GoInstallDeps()
    end,
    ---@type gopher.Config
    opts = {},
  },
  {
    "ray-x/go.nvim",
    enabled = false,
    dependencies = { -- optional packages
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    ft = "go",
    opts = {},
  },

  -- markdown
  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    build = "cd app && pnpm install",
  },
}
