local M = {}

M.common_capabilities = (function()
  local global_capabilities = vim.lsp.protocol.make_client_capabilities()
  -- global_capabilities.offsetEncoding = { "utf-16" }
  local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
  local has_blink, blink = pcall(require, "blink.cmp")
  global_capabilities = vim.tbl_deep_extend(
    "force",
    {},
    vim.lsp.protocol.make_client_capabilities(),
    has_cmp and cmp_nvim_lsp.default_capabilities() or {},
    has_blink and blink.get_lsp_capabilities() or {}
  )
  global_capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
  }

  global_capabilities.textDocument.completion.completionItem.snippetSupport =
    true
  global_capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = true
  return global_capabilities
end)()

function M.common_on_attach(client, bufnr)
  if client.server_capabilities.signatureHelpProvider then
    require("lsp-overloads").setup(client, {})
  end
end

function M.init() end

return M
