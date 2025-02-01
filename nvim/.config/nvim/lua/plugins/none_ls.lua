return {
  {
    "sbdchd/neoformat",
    cmd = "Neoformat",
    keys = {
      {
        "<M-S-f>",
        "<cmd>Neoformat<cr>",
        desc = "Neoformat",
      },
    },
  },

  {
    "lukas-reineke/lsp-format.nvim",
    lazy = true,
    opts = {},
  },

  {
    "nvimtools/none-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "mason.nvim" },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local none_ls = require("null-ls")
      local conditions = require("utils.conditions")

      none_ls.setup({
        sources = {
          none_ls.builtins.formatting.stylua,
          none_ls.builtins.formatting.shfmt,
          none_ls.builtins.formatting.prettierd.with({
            condition = function()
              return conditions.use_prettier()
            end,
          }),
          -- null_ls.builtins.formatting.prettier,
          none_ls.builtins.formatting.fish_indent,
          none_ls.builtins.formatting.nginx_beautifier,
          -- none_ls.builtins.formatting.gofmt,
          -- none_ls.builtins.formatting.goimports,
          -- none_ls.builtins.formatting.gofumpt,
          none_ls.builtins.formatting.cmake_format,
          none_ls.builtins.formatting.dart_format,
          none_ls.builtins.formatting.csharpier,
          none_ls.builtins.formatting.google_java_format,
          none_ls.builtins.formatting.ktlint,
          none_ls.builtins.formatting.clang_format,
          -- null_ls.builtins.formatting.asmfmt,
          none_ls.builtins.formatting.rustywind,

          none_ls.builtins.diagnostics.fish,
          none_ls.builtins.diagnostics.checkmake,
          none_ls.builtins.diagnostics.commitlint,
          none_ls.builtins.diagnostics.selene,
        },
        on_attach = function(client, bufnr)
          require("utils.native_lsp").common_on_attach(client, bufnr)
          require("lsp-format").on_attach(client)
        end,
      })

      local muon = {
        name = "muon",
        method = none_ls.methods.FORMATTING,
        filetypes = { "meson" },
        generator = require("null-ls.helpers").formatter_factory({
          command = "muon",
          args = { "fmt", "$FILENAME" },
        }),
      }
      none_ls.register(muon)

      local caddy = {
        name = "caddy",
        method = none_ls.methods.FORMATTING,
        filetypes = { "Caddyfile" },
        generator = require("null-ls.helpers").formatter_factory({
          command = "caddy",
          args = { "fmt", "$FILENAME" },
        }),
      }
      none_ls.register(caddy)
    end,
  },
}
