local editor = {}

editor.cursorline = function()
    require('nvim-cursorline').setup {
        cursorline = {
            enable = false,
            timeout = 1000,
            number = false,
        },
        cursorword = {
            enable = true,
            min_length = 3,
            hl = { underline = true },
        }
    }
end

editor.autopairs = function()
    require('nvim-autopairs').setup {}
    local cmp_autopairs = require('nvim-autopairs.completion.cmp')
    local cmp = require('cmp')
    cmp.event:on('confirm_done',
        cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))
end

editor.comment = function()
    require("Comment").setup(
    -- NOTE: The example below is a proper integration and it is RECOMMENDED.
        {
            ---@param ctx Ctx
            pre_hook = function(ctx)
                -- Only calculate commentstring for tsx filetypes
                if vim.bo.filetype == 'typescriptreact' then
                    local U = require('Comment.utils')

                    -- Detemine whether to use linewise or blockwise commentstring
                    local type = ctx.ctype == U.ctype.line and '__default' or '__multiline'

                    -- Determine the location where to calculate commentstring from
                    local location = nil
                    if ctx.ctype == U.ctype.block then
                        location = require('ts_context_commentstring.utils').get_cursor_location()
                    elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
                        location = require('ts_context_commentstring.utils').get_visual_start_location()
                    end

                    return require('ts_context_commentstring.internal').calculate_commentstring({
                        key = type,
                        location = location,
                    })
                end
            end,
        })
end

editor.hop = function()
    require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
end

editor.hlslens = function()
    local kopts = { noremap = true, silent = true }

    vim.api.nvim_set_keymap('n', 'n',
        [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
        kopts)
    vim.api.nvim_set_keymap('n', 'N',
        [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
        kopts)
    vim.api.nvim_set_keymap('n', '*', [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
    vim.api.nvim_set_keymap('n', '#', [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
    vim.api.nvim_set_keymap('n', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
    vim.api.nvim_set_keymap('n', 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)

    vim.api.nvim_set_keymap('n', '<Leader>l', ':noh<CR>', kopts)

end

editor.neoscroll = function()
    require('neoscroll').setup()
end

editor.context_vt = function()
    require('nvim_context_vt').setup()
end

editor.specs = function()
    require('specs').setup {
        show_jumps       = true,
        min_jump         = 30,
        popup            = {
            delay_ms = 0, -- delay before popup displays
            inc_ms = 10, -- time increments used for fade/resize effects
            blend = 10, -- starting blend, between 0-100 (fully transparent), see :h winblend
            width = 10,
            winhl = "PMenu",
            fader = require('specs').linear_fader,
            resizer = require('specs').shrink_resizer
        },
        ignore_filetypes = {},
        ignore_buftypes  = {
            nofile = true,
        },
    }
end

editor.autosave = function()
    local autosave = require("autosave")

    autosave.setup(
        {
            enabled = false,
            execution_message = "AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"),
            events = { "InsertLeave", "TextChanged" },
            conditions = {
                exists = true,
                filename_is_not = {},
                filetype_is_not = {},
                modifiable = true
            },
            write_all_buffers = false,
            on_off_commands = true,
            clean_command_line_interval = 0,
            debounce_delay = 135
        }
    )
end

editor.iswap = function()
    require('iswap').setup({})
end

return editor
