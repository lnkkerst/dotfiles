local lang = {}

lang.jdtls = function() end

lang.rust_tools = function()
	require("rust-tools").setup({})
end

lang.crates = function()
	vim.cmd([[ autocmd FileType toml lua require('cmp').setup.buffer { sources = { { name = 'crates' } } } ]])
end

return lang
