local lsp = {}

lsp.lspconfig = function() end

local lsp_ui_config = function()
    local signs = { Error = "", Warn = "", Hint = "", Info = "" }
    for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

end

lsp.lspsaga = function()
    vim.cmd("highlight link LspSagaFinderSelection Search")
    local lspsaga = require 'lspsaga'
    lspsaga.setup { -- defaults ...
        debug = false,
        use_saga_diagnostic_sign = true,
        -- diagnostic sign
        error_sign = "",
        warn_sign = "",
        hint_sign = "",
        infor_sign = "",
        diagnostic_header_icon = "   ",
        -- code action title icon
        code_action_icon = " ",
        code_action_prompt = {
            enable = true,
            sign = true,
            sign_priority = 40,
            virtual_text = true
        },
        finder_definition_icon = "  ",
        finder_reference_icon = "  ",
        max_preview_lines = 10,
        finder_action_keys = {
            open = "o",
            vsplit = "s",
            split = "i",
            quit = "q",
            scroll_down = "<C-f>",
            scroll_up = "<C-b>"
        },
        code_action_keys = { quit = "q", exec = "<CR>" },
        rename_action_keys = { quit = "<C-c>", exec = "<CR>" },
        definition_preview_icon = "  ",
        border_style = "single",
        rename_prompt_prefix = "➤",
        rename_output_qflist = { enable = false, auto_open_qflist = false },
        server_filetype_map = {},
        diagnostic_prefix_format = "%d. ",
        diagnostic_message_format = "%m %c",
        highlight_prefix = false
    }
end

lsp.lsp_installer = function ()
end

lsp.lsp_setup = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
    require('nvim-lsp-setup').setup({
        -- nvim-lsp-installer
        -- https://github.com/williamboman/nvim-lsp-installer#configuration
        installer = {},
        -- Default mappings
        -- gD = 'lua vim.lsp.buf.declaration()',
        -- gd = 'lua vim.lsp.buf.definition()',
        -- gt = 'lua vim.lsp.buf.type_definition()',
        -- gi = 'lua vim.lsp.buf.implementation()',
        -- gr = 'lua vim.lsp.buf.references()',
        -- K = 'lua vim.lsp.buf.hover()',
        -- ['<C-k>'] = 'lua vim.lsp.buf.signature_help()',
        -- ['<space>rn'] = 'lua vim.lsp.buf.rename()',
        -- ['<space>ca'] = 'lua vim.lsp.buf.code_action()',
        -- ['<space>f'] = 'lua vim.lsp.buf.formatting()',
        -- ['<space>e'] = 'lua vim.diagnostic.open_float()',
        -- ['[d'] = 'lua vim.diagnostic.goto_prev()',
        -- [']d'] = 'lua vim.diagnostic.goto_next()',
        default_mappings = false,
        -- Custom mappings, will overwrite the default mappings for the same key
        -- Example mappings for telescope pickers:
        -- gd = 'lua require"telescope.builtin".lsp_definitions()',
        -- gi = 'lua require"telescope.builtin".lsp_implementations()',
        -- gr = 'lua require"telescope.builtin".lsp_references()',
        mappings = {},
        -- Global on_attach
        on_attach = function(client, bufnr)
            require("aerial").on_attach(client)
            require('nvim-lsp-setup.utils').format_on_save(client)
        end,
        -- Global capabilities
        capabilities = capabilities,
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
            sumneko_lua = require('lua-dev').setup({
                lspconfig = {
                    on_attach = function(client, _)
                        -- Avoiding LSP formatting conflicts.
                        -- https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Avoiding-LSP-formatting-conflicts
                        require('nvim-lsp-setup.utils').disable_formatting(client)
                    end,
                },
            }),
            jsonls = {
                settings = {
                    json = {
                        schemas = require("schemastore").json.schemas()
                    }
                }
            },
            texlab = {},
            volar = {},
            html = {},
            lemminx = {},
            tailwindcss = {},
            cssls = {},
            clangd = require('nvim-lsp-setup.clangd_extensions').setup({}),
            tsserver = {},
            pyright = {}
        },
    })
end

lsp.lsp_progress = function()
end

lsp.lsp_colors = function()
    require("lsp-colors").setup({
        Error = "#db4b4b",
        Warning = "#e0af68",
        Information = "#0db9d7",
        Hint = "#10B981"
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
        position = 'right',
        relative_width = true,
        width = 25,
        auto_close = false,
        show_numbers = false,
        show_relative_numbers = false,
        show_symbol_details = true,
        preview_bg_highlight = 'Pmenu',
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
            Key = { icon = "🔐", hl = "TSType" },
            Null = { icon = "NULL", hl = "TSType" },
            EnumMember = { icon = "", hl = "TSField" },
            Struct = { icon = "𝓢", hl = "TSType" },
            Event = { icon = "🗲", hl = "TSType" },
            Operator = { icon = "+", hl = "TSOperator" },
            TypeParameter = { icon = "𝙏", hl = "TSParameter" }
        }
    }
end

lsp.virtual_types = function()
end

return lsp
