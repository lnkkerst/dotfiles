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

return editor
