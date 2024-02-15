return {
  {
    "Saecki/crates.nvim",
    -- event = "BufRead Cargo.toml",
    config = function()
      local crates = require("crates")

      crates.setup({
        null_ls = {
          enabled = true,
          name = "crates.nvim",
        },
        popup = {
          autofocus = true,
          border = "single",
        },
      })

      local commands = {
        ["toggle"] = crates.toggle,
        ["reload"] = crates.reload,
        ["show_features"] = crates.show_features_popup,
        ["show_versions"] = crates.show_versions_popup,
        ["show_dependencies"] = crates.show_dependencies_popup,
      }

      vim.api.nvim_create_user_command("Crates", function(args)
        commands[args.fargs[1]]()
      end, {
        nargs = "+",
        complete = function()
          return vim.tbl_keys(commands)
        end,
      })
    end,
  },
}
