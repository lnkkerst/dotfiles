local editor = {}

editor.autopairs = function()
	require("nvim-autopairs").setup({})
	local cmp_autopairs = require("nvim-autopairs.completion.cmp")
	local cmp = require("cmp")
	cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
end

editor.cursorword = function()
	vim.g.cursorword_min_width = 3
	vim.g.cursorword_max_width = 50
	vim.g.cursorword_disable_filetypes = {}
end

editor.comment = function()
	require("Comment").setup(
		-- NOTE: The example below is a proper integration and it is RECOMMENDED.
		{
			---@param ctx Ctx
			pre_hook = function(ctx)
				-- Only calculate commentstring for tsx filetypes
				if vim.bo.filetype == "typescriptreact" then
					local U = require("Comment.utils")

					-- Detemine whether to use linewise or blockwise commentstring
					local type = ctx.ctype == U.ctype.line and "__default" or "__multiline"

					-- Determine the location where to calculate commentstring from
					local location = nil
					if ctx.ctype == U.ctype.block then
						location = require("ts_context_commentstring.utils").get_cursor_location()
					elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
						location = require("ts_context_commentstring.utils").get_visual_start_location()
					end

					return require("ts_context_commentstring.internal").calculate_commentstring({
						key = type,
						location = location,
					})
				end
			end,
		}
	)
end

editor.hop = function()
	require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
end

editor.hlslens = function()
	local kopts = { noremap = true, silent = true }

	vim.api.nvim_set_keymap(
		"n",
		"n",
		[[<Cmd>execute("normal! " . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
		kopts
	)
	vim.api.nvim_set_keymap(
		"n",
		"N",
		[[<Cmd>execute("normal! " . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
		kopts
	)
	vim.api.nvim_set_keymap("n", "*", [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
	vim.api.nvim_set_keymap("n", "#", [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
	vim.api.nvim_set_keymap("n", "g*", [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
	vim.api.nvim_set_keymap("n", "g#", [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)

	vim.api.nvim_set_keymap("n", "<Leader>l", ":noh<CR>", kopts)
end
editor.hlslens = function() end

editor.neoscroll = function()
	require("neoscroll").setup()
end

editor.context_vt = function()
	require("nvim_context_vt").setup()
end

editor.specs = function()
	require("specs").setup({
		show_jumps = true,
		min_jump = 30,
		popup = {
			delay_ms = 0, -- delay before popup displays
			inc_ms = 10, -- time increments used for fade/resize effects
			blend = 10, -- starting blend, between 0-100 (fully transparent), see :h winblend
			width = 10,
			winhl = "PMenu",
			fader = require("specs").linear_fader,
			resizer = require("specs").shrink_resizer,
		},
		ignore_filetypes = {},
		ignore_buftypes = {
			nofile = true,
		},
	})
end

editor.autosave = function()
	local autosave = require("autosave")
	autosave.setup({
		enabled = false, -- start auto-save when the plugin is loaded (i.e. when your package manager loads it)
		execution_message = {
			message = function() -- message to print on save
				return ("AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"))
			end,
			dim = 0.18, -- dim the color of `message`
			cleaning_interval = 1250, -- (milliseconds) automatically clean MsgArea after displaying `message`. See :h MsgArea
		},
		trigger_events = { "InsertLeave", "TextChanged" }, -- vim events that trigger auto-save. See :h events
		-- function that determines whether to save the current buffer or not
		-- return true: if buffer is ok to be saved
		-- return false: if it's not ok to be saved
		condition = function(buf)
			local fn = vim.fn
			local utils = require("auto-save.utils.data")

			if fn.getbufvar(buf, "&modifiable") == 1 or utils.not_in(fn.getbufvar(buf, "&filetype"), {}) then
				return true -- met condition(s), can save
			end
			return false -- can't save
		end,
		write_all_buffers = false, -- write all buffers when the current one meets `condition`
		debounce_delay = 135, -- saves the file at most every `debounce_delay` milliseconds
		callbacks = { -- functions to be executed at different intervals
			enabling = nil, -- ran when enabling auto-save
			disabling = nil, -- ran when disabling auto-save
			before_asserting_save = nil, -- ran before checking `condition`
			before_saving = nil, -- ran before doing the actual save
			after_saving = nil, -- ran after doing the actual save
		},
	})
end

editor.iswap = function()
	require("iswap").setup({})
end

editor.numb = function()
	require("numb").setup({
		show_numbers = true, -- Enable "number" for the window while peeking
		show_cursorline = true, -- Enable "cursorline" for the window while peeking
		number_only = false, -- Peek only when the command is only a number instead of when it starts with a number
		centered_peeking = true, -- Peeked line will be centered relative to window
	})
end

editor.lastplace = function()
	require("nvim-lastplace").setup({
		-- lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
		-- lastplace_ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
		-- lastplace_open_folds = true
	})
end

editor.pretty_fold = function()
	require("pretty-fold").setup()
	require("pretty-fold.preview").setup()
end

editor.neogen = function()
	require("neogen").setup({
		snippet_engine = "luasnip",
	})
end

editor.tabout = function()
	require("tabout").setup({
		tabkey = "<Tab>", -- key to trigger tabout, set to an empty string to disable
		backwards_tabkey = "<S-Tab>", -- key to trigger backwards tabout, set to an empty string to disable
		act_as_tab = true, -- shift content if tab out is not possible
		act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
		enable_backwards = true, -- well ...
		completion = true, -- if the tabkey is used in a completion pum
		tabouts = {
			{ open = "'", close = "'" },
			{ open = '"', close = '"' },
			{ open = "`", close = "`" },
			{ open = "(", close = ")" },
			{ open = "[", close = "]" },
			{ open = "{", close = "}" },
		},
		ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
		exclude = {}, -- tabout will ignore these filetypes
	})
end

editor.better_escape = function()
	require("better_escape").setup({})
end

editor.colorizer = function()
	require("colorizer").setup({})
end

editor.accelerated_jk = function() end

return editor
