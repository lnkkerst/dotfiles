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
    ft = { "python" },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "python" },
        callback = function()
          require("swenv.api").auto_venv()
        end,
      })
      vim.api.nvim_create_user_command("VenvS", function()
        require("swenv.api").pick_venv()
      end, {})
    end,
    opts = function()
      return {
        venvs_path = vim.fn.expand("~/.virtualenvs"),
        post_set_venv = function()
          local client = vim.lsp.get_clients({ name = "basedpyright" })[1]
          if not client then
            return
          end
          local venv = require("swenv.api").get_current_venv()
          if not venv then
            return
          end
          local venv_python = venv.path .. "/bin/python"
          if client.settings then
            client.settings = vim.tbl_deep_extend(
              "force",
              client.settings,
              { python = { pythonPath = venv_python } }
            )
          else
            client.config.settings = vim.tbl_deep_extend(
              "force",
              client.config.settings,
              { python = { pythonPath = venv_python } }
            )
          end
          client.notify("workspace/didChangeConfiguration", { settings = nil })
        end,
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
  {
    "MeanderingProgrammer/render-markdown.nvim",
    enabled = true,
    ft = { "markdown" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },

  -- java
  {
    "nvim-java/nvim-java",
    enabled = true,
    ft = { "java" },
    opts = {},
  },
}
