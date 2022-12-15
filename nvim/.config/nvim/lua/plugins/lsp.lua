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

lsp.lsp_setup = function()
  vim.keymap.set(
    "n",
    "[d",
    vim.diagnostic.goto_prev,
    { noremap = true, silent = true }
  )
  vim.keymap.set(
    "n",
    "]d",
    vim.diagnostic.goto_next,
    { noremap = true, silent = true }
  )

  local global_capabilities = require("cmp_nvim_lsp").default_capabilities()
  global_capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
  }
  -- global_capabilities.offsetEncoding = { "utf-8", "utf-16" }
  global_capabilities.textDocument.completion.completionItem.snippetSupport =
    true

  local global_attach = function(client, bufnr)
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
          border = "single",
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

    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
    vim.keymap.set("n", "<C-S-k>", vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set(
      "n",
      "<space>wr",
      vim.lsp.buf.remove_workspace_folder,
      bufopts
    )
    vim.keymap.set("n", "<space>wl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
    vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
    vim.keymap.set("n", "<space>f", function()
      vim.lsp.buf.format({ async = true })
    end, bufopts)

    local goto_preview = require("goto-preview")
    goto_preview.setup()

    vim.keymap.set("n", "gpd", goto_preview.goto_preview_definition, bufopts)
    vim.keymap.set(
      "n",
      "gpt",
      goto_preview.goto_preview_type_definition,
      bufopts
    )
    vim.keymap.set(
      "n",
      "gpi",
      goto_preview.goto_preview_implementation,
      bufopts
    )
    vim.keymap.set("n", "gP", goto_preview.close_all_win, bufopts)
    vim.keymap.set("n", "gpr", goto_preview.goto_preview_references, bufopts)

    require("nvim-navic").attach(client, bufnr)
  end

  require("lsp-setup").setup({
    default_mappings = false,
    mappings = {},
    on_attach = global_attach,
    capabilities = global_capabilities,
    servers = {
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
        },
      }),

      sumneko_lua = {
        settings = {
          Lua = {
            completion = {
              callSnippet = "Replace",
            },
          },
        },
      },

      jsonls = {
        settings = {
          json = {
            schemas = require("schemastore").json.schemas(),
          },
        },
      },

      volar = {},
      html = {},
      eslint = {},
      cssls = {},
      cssmodules_ls = {},

      clangd = require("lsp-setup.clangd_extensions").setup({}),

      cmake = {},
      pyright = {},
      bashls = {},
      dockerls = {},
      emmet_ls = {},
      yamlls = {},
      zls = {},
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
  local null_ls = require("null-ls")

  null_ls.setup({
    sources = {
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.shfmt,
      null_ls.builtins.formatting.prettierd,
      null_ls.builtins.formatting.rustfmt,
      null_ls.builtins.formatting.taplo,
      -- null_ls.builtins.formatting.autopep8,
      null_ls.builtins.formatting.black,
      null_ls.builtins.formatting.fish_indent,
      null_ls.builtins.formatting.eslint_d,
      null_ls.builtins.formatting.markdownlint,
      null_ls.builtins.formatting.markdown_toc,
      null_ls.builtins.formatting.nginx_beautifier,
      null_ls.builtins.formatting.zigfmt,
      null_ls.builtins.diagnostics.fish,
      -- null_ls.builtins.diagnostics.markdownlint,
      null_ls.builtins.diagnostics.tidy,
      -- null_ls.builtins.diagnostics.stylelint,
      null_ls.builtins.diagnostics.checkmake,
      null_ls.builtins.diagnostics.commitlint,
    },
    on_attach = require("lsp-format").on_attach,
  })
end

lsp.lsp_format = function()
  require("lsp-format").setup({})
end

lsp.neodev = function()
  require("neodev").setup({})
end

return lsp
