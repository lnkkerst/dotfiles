---@diagnostic disable: param-type-mismatch, redundant-parameter, missing-parameter

return {
  {
    "nvimdev/lspsaga.nvim",
    -- branch = "main",
    event = "LspAttach",
    dependencies = { "nvim-lspconfig" },
    config = function()
      local saga = require("lspsaga")
      local wk = require("which-key")

      saga.setup({
        ui = {
          theme = "round",
          border = "single",
          code_action = "",
          colors = require("catppuccin.groups.integrations.lsp_saga").custom_colors(),
          kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
        },
        code_action = {
          show_server_name = true,
          extend_gitsigns = true,
        },
        rename = {
          in_select = false,
        },
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local bufnr = args.buf
          wk.register({
            ["g"] = {
              ["d"] = { "<cmd>Lspsaga peek_definition<cr>", "Peek definition" },
              ["D"] = {
                "<cmd>Lspsaga peek_type_definition<cr>",
                "Peek type definition",
              },
              ["h"] = { "<cmd>Lspsaga finder<cr>", "Lsp finder" },
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
                require("lspsaga.diagnostic"):goto_next({
                  severity = vim.diagnostic.severity.ERROR,
                })
              end,
              "Jump to next error diagnostic",
            },
            ["[D"] = {
              function()
                require("lspsaga.diagnostic"):goto_prev({
                  severity = vim.diagnostic.severity.ERROR,
                })
              end,
              "Jump to prev error diagnostic",
            },
            ["K"] = { "<cmd>Lspsaga hover_doc<cr>", "Hover doc" },
            ["<leader>"] = {
              ["ca"] = { "<cmd>Lspsaga code_action<cr>", "Code Action" },
              ["rn"] = { "<cmd>Lspsaga rename<cr>", "Rename symbol" },
              ["cd"] = {
                "<cmd>Lspsaga show_line_diagnostics<CR>",
                "Show line diagnostics",
              },
            },
          }, { buffer = bufnr })

          wk.register({
            ["<leader>ca"] = { "<cmd>Lspsaga code_action<cr>", "Code Action" },
          }, { buffer = bufnr, mode = "x" })
        end,
      })

      -- saga.init_lsp_saga({
      --   diagnostic_header = { "😡", "😥", "😤", "😐" },
      --   code_action_icon = "",
      --   custom_kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
      --   symbol_in_winbar = {
      --     in_custom = true,
      --     click_support = function(node, clicks, button, modifiers)
      --       -- To see all available details: vim.pretty_print(node)
      --       local st = node.range.start
      --       local en = node.range["end"]
      --       if button == "l" then
      --         if clicks == 2 then
      --         -- double left click to do nothing
      --         else -- jump to node's starting line+char
      --           vim.fn.cursor(st.line + 1, st.character + 1)
      --         end
      --       elseif button == "r" then
      --         if modifiers == "s" then
      --           print("lspsaga") -- shift right click to print "lspsaga"
      --         end -- jump to node's ending line+char
      --         vim.fn.cursor(en.line + 1, en.character + 1)
      --       elseif button == "m" then
      --         -- middle click to visual select node
      --         vim.fn.cursor(st.line + 1, st.character + 1)
      --         vim.cmd("normal v")
      --         vim.fn.cursor(en.line + 1, en.character + 1)
      --       end
      --     end,
      --   },
      -- })

      -- vim.wo.winbar = require("lspsaga.symbolwinbar"):get_winbar()

      -- local function get_file_name(include_path)
      --   local file_name = require("lspsaga.symbolwinbar").get_file_name()
      --   if vim.fn.bufname("%") == "" then
      --     return ""
      --   end
      --   if include_path == false then
      --     return file_name
      --   end
      --   -- Else if include path: ./lsp/saga.lua -> lsp > saga.lua
      --   local sep = vim.loop.os_uname().sysname == "Windows" and "\\" or "/"
      --   local path_list =
      --     vim.split(string.gsub(vim.fn.expand("%:~:.:h"), "%%", ""), sep)
      --   local file_path = ""
      --   for _, cur in ipairs(path_list) do
      --     file_path = (cur == "." or cur == "~") and ""
      --       or file_path .. cur .. " " .. "%#LspSagaWinbarSep#>%*" .. " %*"
      --   end
      --   return file_path .. file_name
      -- end

      -- local function config_winbar_or_statusline()
      --   local exclude = {
      --     ["terminal"] = true,
      --     ["toggleterm"] = true,
      --     ["prompt"] = true,
      --     ["NvimTree"] = true,
      --     ["help"] = true,
      --     ["lspsagaoutline"] = true,
      --   } -- Ignore float windows and exclude filetype
      --   if vim.api.nvim_win_get_config(0).zindex or exclude[vim.bo.filetype] then
      --     vim.wo.winbar = ""
      --   else
      --     local ok, lspsaga = pcall(require, "lspsaga.symbolwinbar")
      --     local sym
      --     if ok then
      --       sym = lspsaga.get_symbol_node()
      --     end
      --     local win_val = ""
      --     win_val = get_file_name(true) -- set to true to include path
      --     if sym ~= nil then
      --       win_val = win_val .. sym
      --     end
      --     vim.wo.winbar = win_val
      --     -- if work in statusline
      --     -- vim.wo.stl = win_val
      --   end
      -- end

      -- local events = { "BufEnter", "BufWinEnter", "CursorMoved" }

      -- vim.api.nvim_create_autocmd(events, {
      --   pattern = "*",
      --   callback = function()
      --     config_winbar_or_statusline()
      --   end,
      -- })

      -- vim.api.nvim_create_autocmd("User", {
      --   pattern = "LspsagaUpdateSymbol",
      --   callback = function()
      --     config_winbar_or_statusline()
      --   end,
      -- })

      local wk = require("which-key")

      wk.register({
        ["<A-s>"] = { "<cmd>Lspsaga outline<cr>", "Lspsaga outline" },
      })
    end,
  },
}
