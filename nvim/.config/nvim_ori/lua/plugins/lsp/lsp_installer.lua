return function()
    local lsp_installer = require("nvim-lsp-installer")
    lsp_installer.settings({
        ui = {
            icons = {
                server_installed = "✓",
                server_pending = "➜",
                server_uninstalled = "✗"
            }
        }
    })
    local function on_attach(client, bufnr)
        -- Set up buffer-local keymaps (vim.api.nvim_buf_set_keymap()), etc.
        require("lsp_signature").on_attach({
            bind = true,
            use_lspsaga = false,
            floating_window = true,
            fix_pos = true,
            hint_enable = true,
            hi_parameter = "Search",
            handler_opts = {"double"}
        })
        -- require("aerial").on_attach(client)

        if client.resolved_capabilities.document_formatting then
            vim.cmd([[augroup Format]])
            vim.cmd([[autocmd! * <buffer>]])
            vim.cmd(
                [[autocmd BufWritePost <buffer> lua require'modules.completion.formatting'.format()]])
            vim.cmd([[augroup END]])
        end
    end
    local enhance_server_opts = {
        -- Provide settings that should only apply to the "eslint" server
        ["eslint"] = function(opts)
            opts.settings = {format = {enable = true}}
        end
    }
    -- Register a handler that will be called for each installed server when it's ready (i.e. when installation is finished
    -- or if the server is already installed).
    lsp_installer.on_server_ready(function(server)
        local opts = {on_attach = on_attach}
        if enhance_server_opts[server.name] then
            -- Enhance the default opts with the server-specific ones
            enhance_server_opts[server.name](opts)
        end
        -- (optional) Customize the options passed to the server
        -- if server.name == "tsserver" then
        --     opts.root_dir = function() ... end
        -- end

        -- This setup() function will take the provided server configuration and decorate it with the necessary properties
        -- before passing it onwards to lspconfig.
        -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
        server:setup(opts)
    end)
end
