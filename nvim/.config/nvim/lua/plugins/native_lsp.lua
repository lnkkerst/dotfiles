local wk = require("which-key")
local lsp_format = require("lsp-format")

-- Mason
require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})
require("mason-lspconfig").setup({})

local signs = {
  Error = " ",
  Warn = " ",
  Info = " ",
  Hint = " ",
}
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
  signs = true,
  update_in_insert = true,
  underline = false,
  severity_sort = true,
  virtual_text = true,
})

-- Lspconfig
local lspconfig = require("lspconfig")

local global_capabilities = require("cmp_nvim_lsp").default_capabilities()
global_capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}
global_capabilities.textDocument.completion.completionItem.snippetSupport = true

local global_attach = function(client, bufnr)
  wk.register({
    ["g"] = {
      ["d"] = { "<cmd>Lspsaga peek_definition<cr>", "Peek definition" },
      ["h"] = { "<cmd>Lspsaga lsp_finder<cr>", "Lsp finder" },
    },
    ["]d"] = {
      "<cmd>Lspsaga diagnostic_jump_next<cr>",
      "Jump to next diagnostic",
    },
    ["[d"] = {
      "<cmd>Lspsaga diagnostic_jump_prev<cr>",
      "Jump to prev diagnostic",
    },
    ["]D"] = {
      function()
        require("lspsaga.diagnostic").goto_next({
          severity = vim.diagnostic.severity.ERROR,
        })
      end,
      "Jump to next error diagnostic",
    },
    ["[D"] = {
      function()
        require("lspsaga.diagnostic").goto_prev({
          severity = vim.diagnostic.severity.ERROR,
        })
      end,
      "Jump to prev error diagnostic",
    },
    ["K"] = { "<cmd>Lspsaga hover_doc<cr>", "Hover doc" },
    ["<leader>"] = {
      ["ca"] = { "<cmd>Lspsaga code_action<cr>", "Code Action" },
      ["rn"] = { "<cmd>Lspsaga rename<cr>", "Rename symbol" },
    },
  }, { buffer = bufnr })

  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
end

local servers = {
  "pyright",
  "volar",
  "html",
  "eslint",
  "cssls",
  "cmake",
  "bashls",
  "dockerls",
  "emmet_ls",
  "yamlls",
  "zls",
}

for _, server in ipairs(servers) do
  lspconfig[server].setup({
    on_attach = global_attach,
    capabilities = global_capabilities,
  })
end

require("rust-tools").setup({
  server = {
    on_attach = global_attach,
    capabilities = global_capabilities,
  },
})

require("clangd_extensions").setup({
  server = {
    on_attach = function(client, bufnr)
      global_attach(client, bufnr)
      lsp_format.on_attach(client)
    end,
    capabilities = global_capabilities,
  },
})

-- require("lspconfig").ccls.setup({
--   on_attach = function(client, bufnr)
--     global_attach(client, bufnr)
--     lsp_format.on_attach(client)
--   end,
--   capabilities = global_capabilities,
-- })

require("typescript").setup({
  server = {
    on_attach = global_attach,
    capabilities = global_capabilities,
  },
})

require("neodev").setup({})

lspconfig.sumneko_lua.setup({
  on_attach = global_attach,
  capabilities = global_capabilities,
  settings = {
    Lua = {
      completion = {
        callSnippet = "Replace",
      },
    },
  },
})

lspconfig.jsonls.setup({
  settings = {
    json = {
      schemas = require("schemastore").json.schemas(),
    },
  },
})
