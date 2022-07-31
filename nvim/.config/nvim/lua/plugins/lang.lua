local lang = {}

lang.jdtls = function() end

lang.rust_tools = function()
	require("rust-tools").setup({})
end

lang.crates = function()
	vim.api.nvim_create_autocmd("BufRead", {
		group = vim.api.nvim_create_augroup("CmpSourceCargo", { clear = true }),
		pattern = "Cargo.toml",
		callback = function()
			require("cmp").setup.buffer({ sources = { { name = "crates" } } })
		end,
	})
end

return lang
