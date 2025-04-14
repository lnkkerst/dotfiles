local M = {}

M.common_capabilities = (function()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)
  return capabilities
end)()

function M.common_on_attach(client, bufnr)
  if client.server_capabilities.signatureHelpProvider then
    require("lsp-overloads").setup(client, {
      ui = {
        close_events = { "CursorMoved", "BufHidden", "InsertLeave", "WinNew" },
      },
      display_automatically = false,
    })
    vim.keymap.set({ "n", "i" }, "<A-s>", "<cmd>LspOverloadsSignature<CR>")
  end
end

function M.init() end

return M
