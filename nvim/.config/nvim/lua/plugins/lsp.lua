local lsp = {}

lsp.lspconfig = function()
  local signs = {
    Error = " ",
    Warn = " ",
    Info = " ",
    Hint = " ",
  }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end

  vim.diagnostic.config({
    signs = true,
    update_in_insert = true,
    underline = false,
    severity_sort = true,
    virtual_text = false,
  })
end

lsp.mason = function()
  require("mason").setup({
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗",
      },
    },
  })
end

lsp.mason_lspconfig = function()
  require("mason-lspconfig").setup({})
end

lsp.lspsaga = function()
  require("lspsaga").init_lsp_saga({
    saga_winblend = 0,
    diagnostic_header = { "😡", "😥", "😤", "😐" },
    code_action_icon = "",
    -- symbol_in_winbar = {
    --   in_custom = true,
    -- },
    finder_icons = {
      def = "  ",
      ref = "諭 ",
      link = "  ",
    },
  })
end

lsp.lsp_setup = function()
  local global_capabilities = vim.lsp.protocol.make_client_capabilities()
  global_capabilities =
    require("cmp_nvim_lsp").update_capabilities(global_capabilities)
  global_capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
  }
  global_capabilities.offsetEncoding = { "utf-16" }
  global_capabilities.textDocument.completion.completionItem.snippetSupport =
    true

  local global_attach = function(client, bufnr)
    require("aerial").on_attach(client, bufnr)
    require("nvim-navic").attach(client, bufnr)

    vim.api.nvim_create_autocmd("CursorHold", {
      buffer = bufnr,
      callback = function()
        local float_opts = {
          focusable = false,
          close_events = {
            "BufLeave",
            "CursorMoved",
            "InsertEnter",
            "FocusLost",
          },
          border = "rounded",
          source = "always", -- show source in diagnostic popup window
          prefix = " ",
        }

        if not vim.b.diagnostics_pos then
          vim.b.diagnostics_pos = { nil, nil }
        end

        local cursor_pos = vim.api.nvim_win_get_cursor(0)
        if
          (
            cursor_pos[1] ~= vim.b.diagnostics_pos[1]
            or cursor_pos[2] ~= vim.b.diagnostics_pos[2]
          ) and #vim.diagnostic.get() > 0
        then
          vim.diagnostic.open_float(nil, float_opts)
        end

        vim.b.diagnostics_pos = cursor_pos
      end,
    })
  end

  require("lsp-setup").setup({
    default_mappings = false,
    mappings = {},
    -- Global on_attach
    on_attach = global_attach,
    -- Global capabilities
    capabilities = global_capabilities,
    -- Configuration of LSP servers
    servers = {
      -- Install LSP servers automatically
      -- LSP server configuration please see: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
      rust_analyzer = require("lsp-setup.rust-tools").setup({
        server = {
          settings = {
            ["rust-analyzer"] = {
              cargo = {
                loadOutDirsFromCheck = true,
              },
              procMacro = {
                enable = true,
              },
            },
          },
          on_attach = function(client, bufnr)
            global_attach(client, bufnr)
            require("virtualtypes").on_attach(client, bufnr)
          end,
        },
      }),
      -- sumneko_lua = require("lua-dev").setup({
      --   lspconfig = {
      --     settings = {
      --       Lua = {
      --         format = {
      --           enable = true,
      --         },
      --       },
      --     },
      --   },
      -- }),
      sumneko_lua = {},
      jsonls = {
        settings = {
          json = {
            schemas = require("schemastore").json.schemas(),
          },
        },
      },
      volar = {},
      html = {},
      tailwindcss = {},
      eslint = {},
      cssls = {},
      clangd = require("lsp-setup.clangd_extensions").setup({
        on_attach = function(client, bufnr)
          global_attach(client, bufnr)
          require("virtualtypes").on_attach(client, bufnr)
        end,
      }),
      pyright = {},
      jdtls = {},
      bashls = {},
      ["emmet-ls"] = {},
    },
  })

  require("typescript").setup({
    disable_commands = false, -- prevent the plugin from creating Vim commands
    debug = false, -- enable debug logging for commands
    server = { -- pass options to lspconfig's setup method
      on_attach = global_attach,
      capabilities = global_capabilities,
    },
  })
end

lsp.lsp_progress = function() end

lsp.lsp_colors = function()
  require("lsp-colors").setup({
    Error = "#db4b4b",
    Warning = "#e0af68",
    Information = "#0db9d7",
    Hint = "#10B981",
  })
end

lsp.fidget = function()
  require("fidget").setup({
    sources = {
      ["null-ls"] = {
        ignore = true,
      },
    },
  })
end

lsp.symbols_outline = function()
  require("symbols-outline").setup()
end

lsp.virtual_types = function() end

lsp.null = function()
  local null = require("null-ls")
  null.setup({
    sources = {
      null.builtins.formatting.stylua,
      null.builtins.formatting.shfmt,
      null.builtins.formatting.prettier,
      null.builtins.formatting.clang_format,
      null.builtins.formatting.rustfmt,
      null.builtins.formatting.autopep8,
      null.builtins.formatting.fish_indent,
      null.builtins.formatting.eslint,
      null.builtins.formatting.markdownlint,
      null.builtins.formatting.markdown_toc,
      -- null.builtins.diagnostics.eslint,
      -- null.builtins.completion.spell,
      -- null.builtins.code_actions.gitsigns,
      null.builtins.diagnostics.fish,
      null.builtins.diagnostics.markdownlint,
    },
    on_attach = require("lsp-format").on_attach,
  })
end

lsp.docs_view = function()
  require("docs-view").setup({
    position = "right",
    width = 60,
  })
end

lsp.inc_rename = function()
  require("inc_rename").setup()
end

lsp.renamer = function()
  require("renamer").setup({
    border_chars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
  })
end

lsp.lint = function() end

lsp.lsp_format = function()
  require("lsp-format").setup({})
end

return lsp
