local ts = {}

ts.treesitter = function()
	require("nvim-treesitter.configs").setup({
		-- A list of parser names, or "all"
		ensure_installed = { "c", "lua", "rust", "cpp", "java", "python", "vue", "typescript" },

		-- Install parsers synchronously (only applied to `ensure_installed`)
		sync_install = false,

		-- List of parsers to ignore installing (for "all")
		ignore_install = {},

		highlight = {
			-- `false` will disable the whole extension
			enable = true,

			-- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
			-- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
			-- the name of the parser)
			-- list of language that will be disabled
			-- disable = { "c", "rust" },

			-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
			-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
			-- Using this option may slow down your editor, and you may see some duplicate highlights.
			-- Instead of true it can also be a list of languages
			additional_vim_regex_highlighting = false,
		},
		textobjects = {
			select = {
				enable = true,

				-- Automatically jump forward to textobj, similar to targets.vim
				lookahead = true,

				keymaps = {
					-- You can use the capture groups defined in textobjects.scm
					["af"] = "@function.outer",
					["if"] = "@function.inner",
					["ac"] = "@class.outer",
					["ic"] = "@class.inner",
				},
			},
		},
		rainbow = {
			enable = true,
			extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
			max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
			--[[ 	colors = {
				"#90CAF9",
				"#9575CD",
				"#26A69A",
				"#EEFF41",
				"#BDBDBD",
				"#FF8A65",
				"#FF5252",
			}, ]]
		},
		autotag = {
			enable = true,
		},
	})
end

ts.context = function()
	require("treesitter-context").setup({
		enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
		max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
		trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
		patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
			-- For all filetypes
			-- Note that setting an entry here replaces all other patterns for this entry.
			-- By setting the 'default' entry below, you can control which nodes you want to
			-- appear in the context window.
			default = {
				"class",
				"function",
				"method",
				-- 'for', -- These won't appear in the context
				-- 'while',
				-- 'if',
				-- 'switch',
				-- 'case',
			},
			-- Example for a specific filetype.
			-- If a pattern is missing, *open a PR* so everyone can benefit.
			--   rust = {
			--       'impl_item',
			--   },
		},
		exact_patterns = {
			-- Example for a specific filetype with Lua patterns
			-- Treat patterns.rust as a Lua pattern (i.e "^impl_item$" will
			-- exactly match "impl_item" only)
			-- rust = true,
		},

		-- [!] The options below are exposed but shouldn't require your attention,
		--     you can safely ignore them.

		zindex = 20, -- The Z-index of the context window
		mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
	})
end

return ts
