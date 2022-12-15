local nvim_cmp = {}

nvim_cmp.cmp = function()
  local cmp = require("cmp")

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
      format = function(entry, vim_item)
        vim_item.kind =
          require("lspkind").symbolic(vim_item.kind, { with_text = false })
        local menu = source_mapping[entry.source.name] or entry.source.name
        local maxwidth = 50

        if entry.source.name == "cmp_tabnine" then
          if
            entry.completion_item.data ~= nil
            and entry.completion_item.data.detail ~= nil
          then
            menu = menu .. entry.completion_item.data.detail
          else
            menu = menu .. "TBN"
          end
        end

        vim_item.menu = menu
        vim_item.abbr = string.sub(vim_item.abbr, 1, maxwidth)

        return vim_item
      end,
    },
    snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
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
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        else
          fallback()
        end
      end, { "i", "s" }),
    }),
    sources = {
      { name = "nvim_lsp", priority = 100 },
      { name = "luasnip", priority = 90 },
      { name = "buffer", keyword_length = 2, priority = 10 },
      { name = "path", priority = 50 },
      { name = "emoji", insert = true, priority = 0 },
      { name = "fish" },
      { name = "nvim_lsp_signature_help" },
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
    }, {
      { name = "nvim_lsp_document_symbol" },
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
end

nvim_cmp.luasnip = function()
  require("luasnip.loaders.from_vscode").lazy_load()
  require("luasnip.loaders.from_snipmate").lazy_load()
end

nvim_cmp.npm = function()
  require("cmp-npm").setup()
end

return nvim_cmp
