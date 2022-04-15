local vim = vim
local neovide_options = {
    neovide_refresh_rate = 140,
    neovide_transparency=0.8,
    neovide_cursor_animation_length=0.13,
    neovide_cursor_vfx_mode = "railgun",
    guifont = "JetBrainsMono Nerd Font:13"
}

for k, v in pairs(neovide_options) do
    vim.g[k] = v
end
