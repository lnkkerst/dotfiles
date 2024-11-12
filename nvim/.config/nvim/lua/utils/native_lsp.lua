local M = {}

M.common_capabilities = (function()
  local global_capabilities = vim.lsp.protocol.make_client_capabilities()
  global_capabilities.offsetEncoding = { "utf-16" }
  global_capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
  }

  local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
  if ok then
    vim.tbl_deep_extend(
      "force",
      global_capabilities,
      cmp_nvim_lsp.default_capabilities()
    )
  end

  global_capabilities.textDocument.completion.completionItem.snippetSupport =
    true
  global_capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = true
  return global_capabilities
end)()

function M.common_on_attach(client, bufnr) end

function M.init() end

return M
