local vim = vim

local bind_options = function(options)
    for k, v in pairs(options) do
        if v == true then
            vim.cmd("set " .. k)
        elseif v == false then
            vim.cmd("set no " .. k)
        else
            vim.cmd("set " .. k .. "=" .. v)
        end
    end
end


