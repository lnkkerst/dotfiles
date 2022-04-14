return function()
    local gps = require("nvim-gps")
    gps.setup({})

    require("lualine").setup({
        sections = {
            lualine_c = {
                {"lsp_progress"}, {gps.get_location, cond = gps.is_available}
            }
        },
        extensions = {"nvim-tree"}
    })
end
