return {
  {
    "nvim-lualine/lualine.nvim",
    -- event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
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

      local function modified()
        if vim.bo.modified then
          return "+"
        elseif vim.bo.modifiable == false or vim.bo.readonly == true then
          return "-"
        end
        return ""
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

      local mini_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { "location" },
      }

      local simple_sections = {
        lualine_a = { "mode" },
        lualine_b = { "filetype" },
        lualine_c = {},
        lualine_x = {},
        lualine_z = { "location" },
      }

      require("lualine").setup({
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
            {
              function()
                local msg = "No Active Lsp"
                local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
                local clients = vim.lsp.get_active_clients()
                if next(clients) == nil then
                  return msg
                end
                for _, client in ipairs(clients) do
                  local filetypes = client.config.filetypes
                  if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                    return client.name
                  end
                end
                return msg
              end,
              icon = " LSP:",
              -- color = { fg = "#ffffff", gui = "bold" },
            },
            { require("codegpt").get_status },
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
          {
            sections = mini_sections,
            filetypes = { "aerial" },
          },
        },
      })
    end,
  },
}
