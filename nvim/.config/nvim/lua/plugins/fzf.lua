local fzf = {}

fzf.telescope = function()
	require("telescope").setup({
		defaults = {
			prompt_prefix = " ",
			selection_caret = " ",
			layout_config = {
				horizontal = { prompt_position = "bottom", results_width = 0.6 },
				vertical = { mirror = false },
			},
			file_previewer = require("telescope.previewers").vim_buffer_cat.new,
			grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
			qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
			file_sorter = require("telescope.sorters").get_fuzzy_file,
			file_ignore_patterns = {},
			generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
			path_display = { "absolute" },
			winblend = 0,
			border = {},
			borderchars = {
				"─",
				"│",
				"─",
				"│",
				"┌",
				"┐",
				"┘",
				"└",
			},
			color_devicons = true,
			use_less = true,
			set_env = { ["COLORTERM"] = "truecolor" },
		},
		extensions = {
			fzf = {
				fuzzy = false, -- false will only do exact matching
				override_generic_sorter = true, -- override the generic sorter
				override_file_sorter = true, -- override the file sorter
				case_mode = "smart_case", -- or "ignore_case" or "respect_case"
				-- the default case_mode is "smart_case"
			},
			frecency = {
				show_scores = true,
				show_unindexed = true,
				ignore_patterns = { "*.git/*", "*/tmp/*" },
			},
		},
	})
end

fzf.neoclip = function()
	require("neoclip").setup({
		history = 5000,
		enable_persistent_history = true,
		length_limit = 1048576,
		continuous_sync = false,
		db_path = vim.fn.stdpath("data") .. "/databases/neoclip.sqlite3",
		filter = nil,
		preview = true,
		default_register = '"',
		default_register_macros = "q",
		enable_macro_history = true,
		content_spec_column = false,
		on_paste = {
			set_reg = false,
		},
		on_replay = {
			set_reg = false,
		},
		keys = {
			telescope = {
				i = {
					select = "<cr>",
					paste = "<c-p>",
					paste_behind = "<c-k>",
					replay = "<c-q>", -- replay a macro
					delete = "<c-d>", -- delete an entry
					custom = {},
				},
				n = {
					select = "<cr>",
					paste = "p",
					paste_behind = "P",
					replay = "q",
					delete = "d",
					custom = {},
				},
			},
			fzf = {
				select = "default",
				paste = "ctrl-p",
				paste_behind = "ctrl-k",
				custom = {},
			},
		},
	})
	require("telescope").load_extension("neoclip")
end

fzf.telescope_fzf_native = function()
	require("telescope").load_extension("fzy_native")
end

fzf.file_browser = function()
	-- You don't need to set any of these options.
	-- IMPORTANT!: this is only a showcase of how you can set default options!
	require("telescope").setup({
		extensions = {
			file_browser = {
				theme = "ivy",
				mappings = {
					["i"] = {
						-- your custom insert mode mappings
					},
					["n"] = {
						-- your custom normal mode mappings
					},
				},
			},
		},
	})
	-- To get telescope-file-browser loaded and working with telescope,
	-- you need to call load_extension, somewhere after setup function:
	require("telescope").load_extension("file_browser")
end

fzf.packer = function()
	require("telescope").load_extension("packer")
end

fzf.symbols = function() end

fzf.github = function()
	require("telescope").load_extension("gh")
end

fzf.frecency = function()
	require("telescope").load_extension("frecency")
end

return fzf
