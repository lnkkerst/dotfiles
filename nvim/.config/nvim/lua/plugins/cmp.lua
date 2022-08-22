local nvim_cmp = {}

nvim_cmp.cmp = function()
	-- vim.cmd([[highlight CmpItemAbbrDeprecated guifg=#D8DEE9 guibg=NONE gui=strikethrough]])
	-- vim.cmd([[highlight CmpItemKindSnippet guifg=#BF616A guibg=NONE]])
	-- vim.cmd([[highlight CmpItemKindUnit guifg=#D08770 guibg=NONE]])
	-- vim.cmd([[highlight CmpItemKindProperty guifg=#A3BE8C guibg=NONE]])
	-- vim.cmd([[highlight CmpItemKindKeyword guifg=#EBCB8B guibg=NONE]])
	-- vim.cmd([[highlight CmpItemAbbrMatch guifg=#5E81AC guibg=NONE]])
	-- vim.cmd([[highlight CmpItemAbbrMatchFuzzy guifg=#5E81AC guibg=NONE]])
	-- vim.cmd([[highlight CmpItemKindVariable guifg=#8FBCBB guibg=NONE]])
	-- vim.cmd([[highlight CmpItemKindInterface guifg=#88C0D0 guibg=NONE]])
	-- vim.cmd([[highlight CmpItemKindText guifg=#81A1C1 guibg=NONE]])
	-- vim.cmd([[highlight CmpItemKindFunction guifg=#B48EAD guibg=NONE]])
	-- vim.cmd([[highlight CmpItemKindMethod guifg=#B48EAD guibg=NONE]])

	local cmp = require("cmp")
	local luasnip = require("luasnip")

	local has_words_before = function()
		local line, col = unpack(vim.api.nvim_win_get_cursor(0))
		return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
	end

	local check_backspace = function()
		local col = vim.fn.col(".") - 1
		return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
	end

	local buffer_option = {
		-- Complete from all visible buffers (splits)
		get_bufnrs = function()
			local bufs = {}
			for _, win in ipairs(vim.api.nvim_list_wins()) do
				bufs[vim.api.nvim_win_get_buf(win)] = true
			end
			return vim.tbl_keys(bufs)
		end,
	}

	local source_mapping = {
		cmp_tabnine = "[TN]",
		buffer = "[BUF]",
		orgmode = "[ORG]",
		nvim_lsp = "[LSP]",
		nvim_lua = "[LUA]",
		path = "[PATH]",
		tmux = "[TMUX]",
		luasnip = "[SNIP]",
		spell = "[SPELL]",
	}

	local compare = require("cmp.config.compare")

	cmp.setup({
		sorting = {
			comparators = {
				cmp.config.compare.exact,
				cmp.config.compare.locality,
				cmp.config.compare.recently_used,
				cmp.config.compare.score,
				cmp.config.compare.offset,
				cmp.config.compare.sort_text,
				cmp.config.compare.order,
			},
		},
		formatting = {
			format = function(entry, vim_item)
				vim_item.kind = require("lspkind").symbolic(vim_item.kind, { with_text = true })
				local menu = source_mapping[entry.source.name]
				local maxwidth = 50

				if entry.source.name == "cmp_tabnine" then
					if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
						menu = menu .. entry.completion_item.data.detail
					else
						menu = menu .. "TBN"
					end
				end

				vim_item.menu = menu
				vim_item.abbr = string.sub(vim_item.abbr, 1, maxwidth)

				return vim_item
			end,
		},
		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
			end,
		},
		window = {
			completion = cmp.config.window.bordered({
				border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
			}),
			documentation = cmp.config.window.bordered({
				border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
			}),
		},
		mapping = cmp.mapping.preset.insert({
			["<C-j"] = cmp.mapping.select_next_item(),
			["<C-k>"] = cmp.mapping.select_prev_item(),
			["<C-Space>"] = cmp.mapping.complete(),
			["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-2), { "i", "c" }),
			["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(2), { "i", "c" }),
			["<C-e>"] = cmp.mapping({
				i = cmp.mapping.abort(),
				c = cmp.mapping.close(),
			}),
			["<CR>"] = cmp.mapping.confirm({
				behavior = cmp.ConfirmBehavior.Replace,
				select = false,
			}),
			["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				elseif luasnip.expand_or_jumpable() then
					luasnip.expand_or_jump()
				else
					fallback()
				end
			end, { "i", "s" }),
			["<S-Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				elseif luasnip.jumpable(-1) then
					luasnip.jump(-1)
				else
					fallback()
				end
			end, { "i", "s" }),
		}),
		sources = {
			{ name = "nvim_lsp" },
			{ name = "luasnip" },
			{ name = "buffer" },
			{ name = "path" },
			{ name = "emoji" },
			{ name = "fish" },
			{ name = "cmdline" },
			{ name = "nvim_lsp_signature_help" },
			{ name = "nvim_lsp_document_symbol" },
			{ name = "spell" },
			{ name = "treesitter" },
			{ name = "calc" },
		},
	})

	-- Set configuration for specific filetype.
	cmp.setup.filetype("gitcommit", {
		sources = cmp.config.sources({
			{ name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
		}, { { name = "buffer" } }),
	})

	-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
	cmp.setup.cmdline("/", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = "buffer" },
		}, {
			{ name = "nvim_lsp_document_symbol" },
		}),
	})

	-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
	cmp.setup.cmdline(":", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = "cmdline" },
			{ name = "path" },
		},
	})
end

nvim_cmp.luasnip = function()
	require("luasnip.loaders.from_vscode").lazy_load()
	require("luasnip.loaders.from_snipmate").lazy_load()
end

nvim_cmp.tabnine = function()
	local tabnine = require("cmp_tabnine.config")
	tabnine:setup({
		max_lines = 1000,
		max_num_results = 20,
		sort = true,
		run_on_every_keystroke = true,
		snippet_placeholder = "..",
		ignored_file_types = {},
		show_prediction_strength = false,
	})
end

nvim_cmp.cmdline_history = function() end

nvim_cmp.rg = function()
	require("cmp").setup({
		sources = {
			{ name = "rg" },
		},
	})
end

return nvim_cmp
