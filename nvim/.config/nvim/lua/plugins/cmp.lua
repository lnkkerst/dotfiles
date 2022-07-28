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
		view = {
			-- entries = { name = "custom", selection_order = "near_cursor" },
		},
		-- sorting = {
		-- 	priority_weight = 2,
		-- 	comparators = {
		-- 		compare.offset,
		-- 		compare.exact,
		-- 		compare.score,
		-- 		compare.recently_used,
		-- 		require("cmp-under-comparator").under,
		-- 		compare.kind,
		-- 		compare.sort_text,
		-- 		compare.length,
		-- 		compare.order,
		-- 	},
		-- },
		formatting = {
			format = require("lspkind").cmp_format({
				mode = "symbol_text", -- show only symbol annotations
				maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
				-- The function below will be called before any actual modifications from lspkind
				-- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
				-- before = function(entry, vim_item)
				--     vim_item.menu = ({
				--         cmp_tabnine = "[TN]",
				--         buffer = "[BUF]",
				--         orgmode = "[ORG]",
				--         nvim_lsp = "[LSP]",
				--         nvim_lua = "[LUA]",
				--         path = "[PATH]",
				--         tmux = "[TMUX]",
				--         luasnip = "[SNIP]",
				--         spell = "[SPELL]"
				--     })[entry.source.name]
				--     return vim_item
				-- end
				before = function(entry, vim_item)
					vim_item.kind = require("lspkind").presets.default[vim_item.kind]

					local menu = source_mapping[entry.source.name]
					if entry.source.name == "cmp_tabnine" then
						if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
							menu = entry.completion_item.data.detail .. " " .. menu
						end
						vim_item.kind = ""
					end

					vim_item.menu = menu
					return vim_item
				end,
			}),
		},
		snippet = {
			-- REQUIRED - you must specify a snippet engine
			expand = function(args)
				-- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
				require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
				-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
				-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
			end,
		},
		window = {
			completion = cmp.config.window.bordered({
				border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
			}),
			documentation = cmp.config.window.bordered(),
		},
		mapping = cmp.mapping.preset.insert({
			["<C-b>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			-- ['<C-A-Space>'] = cmp.mapping.complete(),
			["<C-e>"] = cmp.mapping.abort(),
			["<CR>"] = cmp.mapping.confirm({
				-- behavior = cmp.ConfirmBehavior.Replace,
				select = true,
			}), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
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
		sources_bak = cmp.config.sources({
			{ name = "nvim_lsp" },
			-- { name = 'vsnip' } -- For vsnip users.
			{ name = "luasnip" }, -- For luasnip users.
			-- { name = 'ultisnips' }, -- For ultisnips users.
			-- { name = 'snippy' }, -- For snippy users.
		}, {
			{ name = "buffer" },
		}, {
			{ name = "spell" },
		}, {
			{ name = "path" },
		}, {
			{ name = "cmdline" },
		}, {
			{ name = "nvim_lsp_signature_help" },
		}, {
			{ name = "nvim_lsp_document_symbol" },
		}, {
			{ name = "fish" },
		}, {
			{
				name = "tmux",
				option = {
					all_panes = false,
					label = "[tmux]",
					trigger_characters = { "." },
					trigger_characters_ft = {}, -- { filetype = { '.' } }
				},
			},
		}, {
			{
				name = "npm",
				keyword_length = 4,
				config = {
					ignore = {},
					only_semantic_versions = false,
				},
			},
		}, {
			{ name = "treesitter" },
		}, {
			{ name = "nvim_lua" },
		}, {
			{ name = "calc" },
		}, {
			{ name = "omni" },
		}, {
			{ name = "emoji" },
		}, {
			{ name = "cmp_tabnine" },
		}),
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
		sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
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

nvim_cmp.cmdline_history = function()
	local cmp = require("cmp")
	for _, cmd_type in ipairs({ ":", "/", "?", "@" }) do
		cmp.setup.cmdline(cmd_type, {
			sources = {
				{ name = "cmdline_history" },
			},
		})
	end
end

nvim_cmp.rg = function()
	require("cmp").setup({
		sources = {
			{ name = "rg" },
		},
	})
end

return nvim_cmp
