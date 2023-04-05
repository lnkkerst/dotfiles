local vim = vim

if vim.g.neovide then
  vim.cmd([[set guifont=JetBrainsMono\ Nerd\ Font:h10]])
  vim.g.neovide_refresh_rate = 60
  vim.g.neovide_cursor_vfx_mode = "railgun"
  vim.g.neovide_cursor_animation_length = 0.03
  vim.g.neovide_cursor_trail_length = 0.05
  vim.g.neovide_cursor_antialiasing = true
  vim.g.neovide_cursor_vfx_opacity = 200.0
  vim.g.neovide_cursor_vfx_particle_lifetime = 1.2
  vim.g.neovide_cursor_vfx_particle_speed = 20.0
  vim.g.neovide_cursor_vfx_particle_density = 5.0
  vim.g.neovide_transparency = 0.9
  vim.g.neovide_no_idle = true

  vim.g.terminal_color0 = "#45475A"
  vim.g.terminal_color8 = "#585B70"
  vim.g.terminal_color1 = "#F38BA8"
  vim.g.terminal_color9 = "#F38BA8"
  vim.g.terminal_color2 = "#A6E3A1"
  vim.g.terminal_color10 = "#A6E3A1"
  vim.g.terminal_color3 = "#F9E2AF"
  vim.g.terminal_color11 = "#F9E2AF"
  vim.g.terminal_color4 = "#89B4FA"
  vim.g.terminal_color12 = "#89B4FA"
  vim.g.terminal_color5 = "#F5C2E7"
  vim.g.terminal_color13 = "#F5C2E7"
  vim.g.terminal_color6 = "#94E2D5"
  vim.g.terminal_color14 = "#94E2D5"
  vim.g.terminal_color7 = "#BAC2DE"
  vim.g.terminal_color15 = "#A6ADC8"
end
