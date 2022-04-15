return function()
    local dap = require("dap")
    local dapui = require("dapui")

    dap.listeners.after.event_initialized["dapui"] = function() dapui.open() end
    dap.listeners.after.event_terminated["dapui"] = function() dapui.close() end
    dap.listeners.after.event_exited["dapui"] = function() dapui.close() end

    vim.fn.sign_define("DapBreakpoint",
                       {text = "", texthl = "", linehl = "", numhl = ""})
end
