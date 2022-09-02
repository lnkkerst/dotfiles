local lsp = {}

lsp.lspconfig = function()
  local signs = { Error = "", Warn = "", Hint = "", Info = "" }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end

  vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
      underline = true,
      virtual_text = {
        spacing = 5,
        severity_limit = "Warning",
      },
      update_in_insert = true,
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

  local global_attach = function(client, bufnr)
    require("aerial").on_attach(client)
    -- require("lsp-setup.utils").format_on_save(client)
    require("nvim-navic").attach(client, bufnr)
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
      -- pylsp = {},
      -- rust_analyzer = {
      --     settings = {
      --         ['rust-analyzer'] = {
      --             cargo = {
      --                 loadOutDirsFromCheck = true,
      --             },
      --             procMacro = {
      --                 enable = true,
      --             },
      --         },
      --     },
      -- },
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
      sumneko_lua = require("lua-dev").setup({
        lspconfig = {
          settings = {
            Lua = {
              format = {
                enable = true,
              },
            },
          },
        },
      }),
      jsonls = {
        settings = {
          json = {
            schemas = require("schemastore").json.schemas(),
          },
        },
      },
      volar = {},
      html = {},
      lemminx = {},
      tailwindcss = {},
      eslint = {},
      cssls = {},
      clangd = require("lsp-setup.clangd_extensions").setup({}),
      -- tsserver = {},
      pyright = {},
      jdtls = {},
      bashls = {},
      -- denols = {},
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
  require("fidget").setup({})
end

lsp.symbols_outline = function()
  vim.g.symbols_outline = {
    highlight_hovered_item = true,
    show_guides = true,
    auto_preview = true,
    position = "right",
    relative_width = true,
    width = 25,
    auto_close = false,
    show_numbers = false,
    show_relative_numbers = false,
    show_symbol_details = true,
    preview_bg_highlight = "Pmenu",
    keymaps = { -- These keymaps can be a string or a table for multiple keys
      close = { "<Esc>", "q" },
      goto_location = "<Cr>",
      focus_location = "o",
      hover_symbol = "<C-space>",
      toggle_preview = "K",
      rename_symbol = "r",
      code_actions = "a",
    },
    lsp_blacklist = {},
    symbol_blacklist = {},
    symbols = {
      File = { icon = "", hl = "TSURI" },
      Module = { icon = "", hl = "TSNamespace" },
      Namespace = { icon = "", hl = "TSNamespace" },
      Package = { icon = "", hl = "TSNamespace" },
      Class = { icon = "𝓒", hl = "TSType" },
      Method = { icon = "ƒ", hl = "TSMethod" },
      Property = { icon = "", hl = "TSMethod" },
      Field = { icon = "", hl = "TSField" },
      Constructor = { icon = "", hl = "TSConstructor" },
      Enum = { icon = "ℰ", hl = "TSType" },
      Interface = { icon = "ﰮ", hl = "TSType" },
      Function = { icon = "", hl = "TSFunction" },
      Variable = { icon = "", hl = "TSConstant" },
      Constant = { icon = "", hl = "TSConstant" },
      String = { icon = "𝓐", hl = "TSString" },
      Number = { icon = "#", hl = "TSNumber" },
      Boolean = { icon = "⊨", hl = "TSBoolean" },
      Array = { icon = "", hl = "TSConstant" },
      Object = { icon = "⦿", hl = "TSType" },
      Key = { icon = "", hl = "TSType" },
      Null = { icon = "NULL", hl = "TSType" },
      EnumMember = { icon = "", hl = "TSField" },
      Struct = { icon = "𝓢", hl = "TSType" },
      Event = { icon = "🗲", hl = "TSType" },
      Operator = { icon = "+", hl = "TSOperator" },
      TypeParameter = { icon = "𝙏", hl = "TSParameter" },
    },
  }
end

lsp.virtual_types = function() end

lsp.null = function()
  local null = require("null-ls")
  null.setup({
    -- sources = {
    --   null.builtins.formatting.stylua,
    --   null.builtins.formatting.shfmt,
    --   null.builtins.formatting.prettier,
    --   null.builtins.formatting.clang_format,
    --   null.builtins.diagnostics.eslint,
    --   null.builtins.completion.spell,
    -- },
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
return lsp
