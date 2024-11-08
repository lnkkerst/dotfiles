vim.api.nvim_create_user_command(
  "Cdf",
  "cd %:p:h",
  { desc = "Cd to current file" }
)
