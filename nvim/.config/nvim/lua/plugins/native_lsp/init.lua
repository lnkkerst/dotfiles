local M = {}

M.common_capabilities = (function()
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
  global_capabilities.textDocument.completion.completionItem.snippetSupport =
    true
  global_capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = true
  return global_capabilities
end)()

function M.common_on_attach(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  require("lsp-inlayhints").on_attach(client, bufnr)
end

function M.init()
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

  require("plugins.native_lsp.servers").init_all()
end

return M
