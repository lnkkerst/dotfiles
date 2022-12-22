local cmp = require("cmp")
local lspkind = require("lspkind")
local luasnip = require("luasnip")

local source_mapping = {
  buffer = "[BUF]",
  orgmode = "[ORG]",
  nvim_lsp = "[LSP]",
  nvim_lua = "[LUA]",
  path = "[PATH]",
  tmux = "[TMUX]",
  luasnip = "[SNIP]",
  spell = "[SPELL]",
  treesitter = "[TS]",
  emoji = "[EMO]",
  cmdline = "[CMD]",
  npm = "[NPM]",
  fish = "[FISH]",
  nvim_lsp_signature_help = "[SIGN]",
}

cmp.setup({
  enabled = true,
  preselect = cmp.PreselectMode.None,
  formatting = {
    format = lspkind.cmp_format({
      mode = "symbol_text",
      menu = source_mapping,
    }),
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered({
      border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
    }),
    documentation = cmp.config.window.bordered({
      border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
    }),
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-Space>"] = cmp.mapping.complete({}),
    ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-2), { "i", "c" }),
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(2), { "i", "c" }),
    ["<C-e>"] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ["<CR>"] = cmp.mapping.confirm({
      select = false,
    }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  }),
  sources = {
    { name = "nvim_lsp", priority = 100 },
    -- { name = "luasnip", priority = 90 },
    -- { name = "buffer", keyword_length = 2, priority = 10 },
    { name = "path", priority = 50 },
    { name = "emoji", insert = true, priority = 0 },
    { name = "fish" },
    { name = "nvim_lsp_signature_help", priority = 110 },
  },
  completion = {
    keyword_length = 1,
    completeopt = "menu,noselect",
  },
})

-- Set configuration for specific filetype.
cmp.setup.filetype("gitcommit", {
  sources = cmp.config.sources({
    { name = "git" }, -- You can specify the `cmp_git` source if you were installed it.
  }, { { name = "buffer" } }),
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline("/", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "buffer" },
  }),
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "cmdline" },
    { name = "path" },
  },
})
