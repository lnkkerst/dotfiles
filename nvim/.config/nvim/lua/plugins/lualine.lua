local function lsp()
  local clients = vim.lsp.get_clients()
  local buf = vim.api.nvim_get_current_buf()
  clients = vim
    .iter(clients)
    :filter(function(client)
      return client.attached_buffers[buf]
    end)
    :filter(function(client)
      return client.name ~= "GitHub Copilot"
    end)
    :map(function(client)
      return " " .. client.name
    end)
    :totable()
  local info = table.concat(clients, " ")
  if info == "" then
    return "No attached LSP server"
  else
    return info
  end
end

local function dap()
  ---@diagnostic disable-next-line: redefined-local
  local dap = package.loaded["dap"]
  if dap then
    return dap.status()
  end
  return ""
end

local function dap_or_lsp()
  if dap() ~= "" then
    return dap()
  else
    return lsp()
  end
end

local function modified()
  if vim.bo.modified then
    return "+"
  elseif vim.bo.modifiable == false or vim.bo.readonly == true then
    return "-"
  end
  return ""
end

local function search_result()
  if vim.v.hlsearch == 0 then
    return ""
  end
  local last_search = vim.fn.getreg("/")
  if not last_search or last_search == "" then
    return ""
  end
  local searchcount = vim.fn.searchcount({ maxcount = 9999 })
  return last_search
    .. "("
    .. searchcount.current
    .. "/"
    .. searchcount.total
    .. ")"
end

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 60
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand("%:p:h")
    local gitdir = vim.fn.finddir(".git", filepath .. ";")
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        icons_enabled = true,
        theme = "catppuccin",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {},
        always_divide_middle = true,
        globalstatus = true,
      },

      sections = {
        lualine_a = { "mode" },
        lualine_b = {
          { "branch" },
          {
            "diff",
            cond = conditions.hide_in_width,
          },
        },
        lualine_c = {
          dap_or_lsp,
        },
        lualine_x = {
          {
            "%w",
            cond = function()
              return vim.wo.previewwindow
            end,
          },
          {
            "%r",
            cond = function()
              return vim.bo.readonly
            end,
          },
          {
            "%q",
            cond = function()
              return vim.bo.buftype == "quickfix"
            end,
          },
          { search_result, "filetype" },
          { "diagnostics" },
        },
        lualine_y = {
          { modified },
          { "filetype" },
          { "encoding" },
          { "fileformat" },
        },
        lualine_z = { "progress", "location" },
      },

      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },

      tabline = {},

      extensions = {
        "nvim-tree",
        "toggleterm",
        "nvim-dap-ui",
        "quickfix",
        "symbols-outline",
        "aerial",
        "fzf",
        "lazy",
        "man",
        "mason",
        "overseer",
        "toggleterm",
        "trouble",
      },
    },
  },
}
