local lsp_format = require("lsp-format")
local util = require("lspconfig.util")

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.INFO] = " ",
      [vim.diagnostic.severity.HINT] = " ",
    },
  },
  update_in_insert = true,
  underline = false,
  severity_sort = true,
  virtual_text = {
    source = false,
  },
})

-- Lspconfig
local lspconfig = require("lspconfig")

local global_capabilities = vim.lsp.protocol.make_client_capabilities()
global_capabilities.offsetEncoding = { "utf-16" }
global_capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}
vim.tbl_deep_extend(
  "force",
  global_capabilities,
  require("cmp_nvim_lsp").default_capabilities()
)
global_capabilities.textDocument.completion.completionItem.snippetSupport = true
global_capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = true

_G.lsp_global_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  require("lsp-inlayhints").on_attach(client, bufnr)
end

-- local configs = require("lspconfig.configs")
-- configs["unocss"] = {
--   default_config = {
--     cmd = { "unocss-language-server", "--stdio" },
--     filetypes = {
--       "html",
--       "javascriptreact",
--       "rescript",
--       "typescriptreact",
--       "vue",
--       "svelte",
--     },
--     on_new_config = function(new_config) end,
--     root_dir = function(fname)
--       return util.root_pattern("unocss.config.js", "unocss.config.ts")(fname)
--         or util.find_package_json_ancestor(fname)
--         or util.find_node_modules_ancestor(fname)
--         or util.find_git_ancestor(fname)
--     end,
--   },
-- }

local servers = {
  "html",
  "cssls",
  "stylelint_lsp",
  "cmake",
  "bashls",
  "dockerls",
  "yamlls",
  "zls",
  "gopls",
  "lua_ls",
  "prismals",
  "dartls",
  "taplo",
  "sqlls",
  "csharp_ls",
  "hls",
  "unocss",
  "jdtls",
  "pyright",
}

for _, server in ipairs(servers) do
  lspconfig[server].setup({
    on_attach = lsp_global_attach,
    capabilities = global_capabilities,
  })
end

local servers_with_format = {}

for _, server in ipairs(servers_with_format) do
  lspconfig[server].setup({
    on_attach = function(client, bufnr)
      lsp_global_attach(client, bufnr)
      lsp_format.on_attach(client)
    end,
    capabilities = global_capabilities,
  })
end

lspconfig.tsserver.setup({
  enabled = true,
  on_attach = lsp_global_attach,
  capabilities = global_capabilities,
  settings = {
    javascript = {
      inlayHints = {
        includeInlayEnumMemberValueHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayVariableTypeHints = true,
      },
    },
    typescript = {
      inlayHints = {
        includeInlayEnumMemberValueHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayVariableTypeHints = true,
      },
    },
  },
})

lspconfig.ccls.setup({
  enabled = false,
  on_attach = function(client, bufnr)
    lsp_global_attach(client, bufnr)
    lsp_format.on_attach(client)
  end,
  capabilities = global_capabilities,
  root_dir = lspconfig.util.root_pattern(
    "compile_commands.json",
    ".ccls",
    ".git",
    ".clang-format"
  ),
})

local rt = require("rust-tools")

rt.setup({
  server = {
    on_attach = lsp_global_attach,
    capabilities = global_capabilities,
    root_dir = function(filepath, bufnr)
      local res = util.find_git_ancestor(filepath, bufnr)
      if res then
        return res
      end
      res = util.root_pattern("src-tauri")(filepath, bufnr)
      if res then
        return res
      end
      return util.root_pattern("Cargo.toml", "rust-project.json")(
        filepath,
        bufnr
      )
    end,
  },
  tools = {
    inlay_hints = {
      auto = false,
    },
    hover_actions = {
      auto_focus = true,
      border = "single",
    },
  },
})

require("clangd_extensions").setup({
  server = {
    on_attach = function(client, bufnr)
      lsp_global_attach(client, bufnr)
      lsp_format.on_attach(client)
    end,
    capabilities = global_capabilities,
    cmd = { "clangd", "--enable-config" },
  },
  extensions = {
    autoSetHints = false,
  },
})

lspconfig.clangd.setup({
  on_attach = function(client, bufnr)
    lsp_global_attach(client, bufnr)
    lsp_format.on_attach(client, bufnr)
  end,
  capabilities = global_capabilities,
})

lspconfig.jsonls.setup({
  on_attach = lsp_global_attach,
  capabilities = global_capabilities,
  settings = {
    json = {
      schemas = require("schemastore").json.schemas(),
    },
  },
})

local function get_typescript_server_path(root_dir)
  local global_ts =
    "/home/lnk/.local/share/pnpm/global/5/node_modules/typescript/lib"
  local found_ts = ""
  local function check_dir(path)
    found_ts = util.path.join(path, "node_modules", "typescript", "lib")
    if util.path.exists(found_ts) then
      return path
    end
  end
  if util.search_ancestors(root_dir, check_dir) then
    return found_ts
  else
    return global_ts
  end
end

lspconfig.volar.setup({
  enabled = true,
  on_attach = lsp_global_attach,
  capabilities = global_capabilities,
  filetypes = {
    -- "typescript",
    -- "javascript",
    -- "javascriptreact",
    -- "typescriptreact",
    "vue",
    -- "json",
    -- "sqlls",
  },
  init_options = {
    typescript = {
      tsdk = "/usr/lib/node_modules/typescript/lib",
    },
  },
})

lspconfig.eslint.setup({
  on_attach = function(client, bufnr)
    lsp_global_attach(client, bufnr)
    lsp_format.on_attach(client)
  end,
  capabilities = global_capabilities,
})
