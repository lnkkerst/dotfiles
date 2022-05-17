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

lsp.lsp_installer = function()
    local lsp_installer = require("nvim-lsp-installer")
    local lspconfig = require("lspconfig")

    lsp_installer.settings({
        ui = {
            icons = {
                server_installed = "✓",
                server_pending = "➜",
                server_uninstalled = "✗"
            }
        }
    })
    lsp_installer.setup({})

    local function global_attach(client)
        require("aerial").on_attach(client)
        require("lsp-format").on_attach(client)
    end

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

    lspconfig.util.default_config = vim.tbl_extend(
        "force",
        lspconfig.util.default_config,
        {
            capabilities = capabilities,
            flags = { debounce_text_changes = 500 }
        }
    )

    lspconfig.sumneko_lua.setup({
        on_attach = function(client)
            global_attach(client)
        end
    })

    lspconfig.jsonls.setup({
        on_attach = function(client)
            global_attach(client)
        end,
        settings = {
            json = {
                schemas = require("schemastore").json.schemas()
            }
        }
    })

    lspconfig.clangd.setup({})

    lspconfig.texlab.setup({})

    -- lsp_installer.on_server_ready(function(server)
    --     local opts = {
    --         capabilities = capabilities,
    --         flags = { debounce_text_changes = 500 },
    --         on_attach = function(client)
    --             if server.name == "ocamllsp" then
    --                 require("virtualtypes").on_attach(client)
    --             end
    --             global_attach(client)
    --         end
    --     }
    --
    --     if server.name == "jsonls" then
    --         opts.settings = {
    --             json = {
    --                 schemas = require('schemastore').json.schemas(),
    --             }
    --         }
    --     end
    --     server:setup(opts)
    -- end)
end

lsp.lsputils = function()
    if vim.fn.has('nvim-0.5.1') == 1 then
        vim.lsp.handlers['textDocument/codeAction'] = require 'lsputil.codeAction'.code_action_handler
        vim.lsp.handlers['textDocument/references'] = require 'lsputil.locations'.references_handler
        vim.lsp.handlers['textDocument/definition'] = require 'lsputil.locations'.definition_handler
        vim.lsp.handlers['textDocument/declaration'] = require 'lsputil.locations'.declaration_handler
        vim.lsp.handlers['textDocument/typeDefinition'] = require 'lsputil.locations'.typeDefinition_handler
        vim.lsp.handlers['textDocument/implementation'] = require 'lsputil.locations'.implementation_handler
        vim.lsp.handlers['textDocument/documentSymbol'] = require 'lsputil.symbols'.document_handler
        vim.lsp.handlers['workspace/symbol'] = require 'lsputil.symbols'.workspace_handler
    else
        local bufnr = vim.api.nvim_buf_get_number(0)

        vim.lsp.handlers['textDocument/codeAction'] = function(_, _, actions)
            require('lsputil.codeAction').code_action_handler(nil, actions,
                nil, nil, nil)
        end

        vim.lsp.handlers['textDocument/references'] = function(_, _, result)
            require('lsputil.locations').references_handler(nil, result, {
                bufnr = bufnr
            }, nil)
        end

        vim.lsp.handlers['textDocument/definition'] = function(_, method, result)
            require('lsputil.locations').definition_handler(nil, result, {
                bufnr = bufnr,
                method = method
            }, nil)
        end

        vim.lsp.handlers['textDocument/declaration'] = function(_, method,
                                                                result)
            require('lsputil.locations').declaration_handler(nil, result, {
                bufnr = bufnr,
                method = method
            }, nil)
        end

        vim.lsp.handlers['textDocument/typeDefinition'] = function(_, method,
                                                                   result)
            require('lsputil.locations').typeDefinition_handler(nil, result, {
                bufnr = bufnr,
                method = method
            }, nil)
        end

        vim.lsp.handlers['textDocument/implementation'] = function(_, method,
                                                                   result)
            require('lsputil.locations').implementation_handler(nil, result, {
                bufnr = bufnr,
                method = method
            }, nil)
        end

        vim.lsp.handlers['textDocument/documentSymbol'] = function(_, _, result, _, bufn)
            require('lsputil.symbols').document_handler(nil, result,
                { bufnr = bufn }, nil)
        end

        vim.lsp.handlers['textDocument/symbol'] = function(_, _, result, _, bufn)
            require('lsputil.symbols').workspace_handler(nil, result,
                { bufnr = bufn }, nil)
        end
    end
end

lsp.format = function() require("lsp-format").setup {} end

lsp.lsp_progress = function()

end

lsp.lsp_setup = function()

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
