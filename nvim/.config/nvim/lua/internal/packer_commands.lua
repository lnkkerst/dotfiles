vim.api.nvim_create_user_command(
  "PackerInstall",
  "packadd packer.nvim | lua require('plugins').install()",
  {}
)
vim.api.nvim_create_user_command(
  "PackerUpdate",
  "packadd packer.nvim | lua require('plugins').update()",
  {}
)
vim.api.nvim_create_user_command(
  "PackerSync",
  "packadd packer.nvim | lua require('plugins').sync()",
  {}
)
vim.api.nvim_create_user_command(
  "PackerClean",
  "packadd packer.nvim | lua require('plugins').clean()",
  {}
)
vim.api.nvim_create_user_command(
  "PackerCompile",
  "packadd packer.nvim | lua require('plugins').compile()",
  {}
)
vim.api.nvim_create_user_command("PC", "PackerCompile", {})
vim.api.nvim_create_user_command("PU", "PackerSync", {})
