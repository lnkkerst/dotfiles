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

return editor
