local plugin_lsp = require("utils.native_lsp")
-- local lsp_format = require("lsp-format")
local lspconfig = require("lspconfig")
local utils = require("lspconfig.util")

local M = {}

function M.init()
  lspconfig.clangd.setup({
    on_attach = function(client, bufnr)
      plugin_lsp.common_on_attach(client, bufnr)
      -- lsp_format.on_attach(client, bufnr)
    end,
    capabilities = plugin_lsp.global_capabilities,
    root_dir = utils.root_pattern(
      ".git",
      ".clangd",
      ".clang-tidy",
      ".clang-format",
      "compile_commands.json",
      "compile_flags.txt",
      "configure.ac"
    ),
    cmd = {
      "clangd",
      "--offset-encoding=utf-16",
      -- "--query-driver="
      --   .. require("utils").join_strings(
      --     ",",
      --     unpack({
      --       "/home/lnk/.platformio/packages/toolchain-gccarmnoneeabi@1.70201.0/bin/arm-none-eabi-gcc",
      --       "/home/lnk/.platformio/packages/toolchain-gccarmnoneeabi@1.70201.0/bin/arm-none-eabi-g++",
      --       "/home/lnk/.platformio/packages/toolchain-gccarmnoneeabi@1.100301.220327/bin/arm-none-eabi-gcc",
      --       "/home/lnk/.platformio/packages/toolchain-gccarmnoneeabi@1.100301.220327/bin/arm-none-eabi-g++",
      --       "/home/lnk/.platformio/packages/toolchain-gccarmnoneeabi/bin/arm-none-eabi-gcc",
      --       "/home/lnk/.platformio/packages/toolchain-gccarmnoneeabi/bin/arm-none-eabi-g++",
      --       "/usr/bin/arm-none-eabi-gcc",
      --       "/usr/bin/arm-none-eabi-g++",
      --       "/usr/bin/gcc",
      --       "/usr/bin/g++",
      --     })
      --   ),
    },
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
  })
end

return M
