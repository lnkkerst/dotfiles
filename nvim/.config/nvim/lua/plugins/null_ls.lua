local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.shfmt,
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.formatting.dprint,
    null_ls.builtins.formatting.rustfmt,
    null_ls.builtins.formatting.taplo,
    -- null_ls.builtins.formatting.autopep8,
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.fish_indent,
    -- null_ls.builtins.formatting.eslint_d,
    -- null_ls.builtins.formatting.markdownlint,
    -- null_ls.builtins.formatting.markdown_toc,
    null_ls.builtins.formatting.nginx_beautifier,
    null_ls.builtins.formatting.zigfmt,
    null_ls.builtins.formatting.gofmt,
    null_ls.builtins.formatting.cmake_format,
    null_ls.builtins.formatting.dart_format,
    null_ls.builtins.formatting.csharpier,
    -- null_ls.builtins.formatting.stylish_haskell,
    null_ls.builtins.formatting.fourmolu,
    null_ls.builtins.formatting.google_java_format,
    null_ls.builtins.formatting.ktlint,
    null_ls.builtins.diagnostics.fish,
    -- null_ls.builtins.diagnostics.markdownlint,
    -- null_ls.builtins.diagnostics.tidy,
    -- null_ls.builtins.diagnostics.stylelint,
    null_ls.builtins.diagnostics.checkmake,
    null_ls.builtins.diagnostics.commitlint,
  },
  on_attach = function(client, bufnr)
    lsp_global_attach(client, bufnr)
    require("lsp-format").on_attach(client)
  end,
})

local muon = {
  name = "muon",
  method = null_ls.methods.FORMATTING,
  filetypes = { "meson" },
  generator = require("null-ls.helpers").formatter_factory({
    command = "muon",
    args = { "fmt", "$FILENAME" },
  }),
}

local caddy = {
  name = "caddy",
  method = null_ls.methods.FORMATTING,
  filetypes = { "Caddyfile" },
  generator = require("null-ls.helpers").formatter_factory({
    command = "caddy",
    args = { "fmt", "$FILENAME" },
  }),
}

local prismaFmtLegacy = {
  name = "prisma-fmt",
  method = null_ls.methods.FORMATTING,
  filetypes = { "prisma" },
  generator = require("null-ls.helpers").formatter_factory({
    command = "prisma-fmt",
    args = { "format", "-i", "$FILENAME" },
  }),
}

null_ls.register(muon)
null_ls.register(caddy)
null_ls.register(prismaFmtLegacy)
