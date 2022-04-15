-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/lnk/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/lnk/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/lnk/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/lnk/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/lnk/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["accelerated-jk"] = {
    loaded = true,
    path = "/home/lnk/.local/share/nvim/site/pack/packer/start/accelerated-jk",
    url = "https://github.com/rhysd/accelerated-jk"
  },
  ["bufferline.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\foptions\1\0\0\1\0\3\bmod\fbuffers\fnumbers\tboth\16diagnostics\rnvim_lsp\nsetup\15bufferline\frequire\0" },
    loaded = true,
    path = "/home/lnk/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/lnk/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/home/lnk/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    config = { "\27LJ\2\n;\0\1\4\0\4\0\0066\1\0\0009\1\1\0019\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\20vsnip#anonymous\afn\bvim�\a\1\0\n\0007\0�\0016\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\4\0'\2\5\0B\0\2\0029\1\6\0005\3\n\0005\4\b\0003\5\a\0=\5\t\4=\4\v\0034\4\0\0=\4\f\0039\4\r\0009\4\14\0049\4\15\0045\6\17\0009\a\r\0009\a\16\a)\t��B\a\2\2=\a\18\0069\a\r\0009\a\16\a)\t\4\0B\a\2\2=\a\19\0069\a\r\0009\a\20\aB\a\1\2=\a\21\0069\a\r\0009\a\22\aB\a\1\2=\a\23\0069\a\r\0009\a\24\a5\t\25\0B\a\2\2=\a\26\6B\4\2\2=\4\r\0039\4\27\0009\4\28\0044\6\3\0005\a\29\0>\a\1\0065\a\30\0>\a\2\0064\a\3\0005\b\31\0>\b\1\a4\b\3\0005\t \0>\t\1\bB\4\4\2=\4\28\3B\1\2\0019\1\6\0009\1!\1'\3\"\0005\4%\0009\5\27\0009\5\28\0054\a\3\0005\b#\0>\b\1\a4\b\3\0005\t$\0>\t\1\bB\5\3\2=\5\28\4B\1\3\0019\1\6\0009\1&\1'\3'\0005\4(\0009\5\r\0009\5\14\0059\5&\5B\5\1\2=\5\r\0044\5\3\0005\6)\0>\6\1\5=\5\28\4B\1\3\0019\1\6\0009\1&\1'\3*\0005\4+\0009\5\r\0009\5\14\0059\5&\5B\5\1\2=\5\r\0049\5\27\0009\5\28\0054\a\3\0005\b,\0>\b\1\a4\b\3\0005\t-\0>\t\1\bB\5\3\2=\5\28\4B\1\3\0016\1\4\0'\3.\0B\1\2\0029\1/\0016\3\0\0009\0030\0039\0031\0039\0032\3B\3\1\0A\1\0\0026\2\4\0'\0043\0B\2\2\0029\0024\0029\2\6\0025\0045\0=\0016\4B\2\2\1K\0\1\0\17capabilities\1\0\0\vclangd\14lspconfig\29make_client_capabilities\rprotocol\blsp\24update_capabilities\17cmp_nvim_lsp\1\0\1\tname\fcmdline\1\0\1\tname\tpath\1\0\0\6:\1\0\1\tname\vbuffer\1\0\0\6/\fcmdline\1\0\0\1\0\1\tname\vbuffer\1\0\1\tname\fcmp_git\14gitcommit\rfiletype\1\0\1\tname\nspell\1\0\1\tname\vbuffer\1\0\1\tname\nvsnip\1\0\1\tname\rnvim_lsp\fsources\vconfig\t<CR>\1\0\1\vselect\2\fconfirm\n<C-e>\nabort\14<C-Space>\rcomplete\n<C-f>\n<C-b>\1\0\0\16scroll_docs\vinsert\vpreset\fmapping\vwindow\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\bcmp\frequire\26menu,menuone,noselect\16completeopt\bopt\bvim\0" },
    loaded = true,
    path = "/home/lnk/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/lnk/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-spell"] = {
    loaded = true,
    path = "/home/lnk/.local/share/nvim/site/pack/packer/start/cmp-spell",
    url = "https://github.com/f3fora/cmp-spell"
  },
  ["cmp-vsnip"] = {
    loaded = true,
    path = "/home/lnk/.local/share/nvim/site/pack/packer/start/cmp-vsnip",
    url = "https://github.com/hrsh7th/cmp-vsnip"
  },
  ["dashboard-nvim"] = {
    config = { "\27LJ\2\n�\5\0\0\2\0\6\0\t6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0005\1\5\0=\1\4\0K\0\1\0\1\16\0\0)                    .       .       )          .                         )       ,,/..,.   .       ..         )      .. *(/*,         .... .       )         .. .,,...,  ,.,*.,, .      )            ......//(,,,*.          )            ,,,.*(%#,*,.            )         ..,.,/**/,,, ..            )       , ..*//*(#*,(*(*   .         )     . .,/,,..(,*(/*/* *(*,.        )      ..   **#*/*%*.(*.*, .       . )       ...**,/*#%/#((/*///, . ..   .)..  ..,(/((/**(#(((/*((((//(/......,)(,./(/(/*/(*/(/(###(/(/,*/(/**/**///),,,,*.,.,**...*.*....**//(*(/,,,,...\28dashboard_custom_header\14telescope dashboard_default_executive\6g\bvim\0" },
    loaded = true,
    path = "/home/lnk/.local/share/nvim/site/pack/packer/start/dashboard-nvim",
    url = "https://github.com/glepnir/dashboard-nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\n�\3\0\0\4\0\15\0\0296\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0009\0\3\0\18\2\0\0009\0\4\0'\3\5\0B\0\3\0016\0\0\0009\0\1\0009\0\3\0\18\2\0\0009\0\4\0'\3\6\0B\0\3\0016\0\a\0'\2\b\0B\0\2\0029\0\t\0005\2\n\0005\3\v\0=\3\f\0025\3\r\0=\3\14\2B\0\2\1K\0\1\0\20buftype_exclude\1\3\0\0\rterminal\vnofile\21filetype_exclude\1\22\0\0\rstartify\14dashboard\16dotooagenda\blog\rfugitive\14gitcommit\vpacker\fvimwiki\rmarkdown\tjson\btxt\nvista\thelp\ftodoist\rNvimTree\rpeekaboo\bgit\20TelescopePrompt\rundotree\24flutterToolsOutline\5\1\0\3\31show_current_context_start\2\25show_current_context\2\25space_char_blankline\6 \nsetup\21indent_blankline\frequire\feol:↴\14space:⋅\vappend\14listchars\tlist\bopt\bvim\0" },
    loaded = true,
    path = "/home/lnk/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/home/lnk/.local/share/nvim/site/pack/packer/start/lspsaga.nvim",
    url = "https://github.com/tami5/lspsaga.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n�\5\0\0\b\0#\00086\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\n\0005\4\4\0005\5\5\0=\5\6\0045\5\a\0=\5\b\0044\5\0\0=\5\t\4=\4\v\0035\4\r\0005\5\f\0=\5\14\0045\5\15\0=\5\16\0044\5\3\0005\6\19\0009\a\17\0>\a\1\0069\a\18\0=\a\20\6>\6\1\5=\5\21\0045\5\22\0=\5\23\0045\5\24\0=\5\25\0045\5\26\0=\5\27\4=\4\28\0035\4\29\0004\5\0\0=\5\14\0044\5\0\0=\5\16\0045\5\30\0=\5\21\0045\5\31\0=\5\23\0044\5\0\0=\5\25\0044\5\0\0=\5\27\4=\4 \0034\4\0\0=\4!\0034\4\0\0=\4\"\3B\1\2\1K\0\1\0\15extensions\ftabline\22inactive_sections\1\2\0\0\rlocation\1\2\0\0\rfilename\1\0\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\4\0\0\rencoding\15fileformat\rfiletype\14lualine_c\tcond\1\0\0\17is_available\17get_location\14lualine_b\1\4\0\0\vbranch\tdiff\16diagnostics\14lualine_a\1\0\0\1\2\0\0\tmode\foptions\1\0\0\23disabled_filetypes\23section_separators\1\0\2\nright\b\tleft\b\25component_separators\1\0\2\nright\b\tleft\b\1\0\4\25always_divide_middle\2\17globalstatus\1\ntheme\rmaterial\18icons_enabled\2\nsetup\flualine\rnvim-gps\frequire\0" },
    loaded = true,
    path = "/home/lnk/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["material.nvim"] = {
    config = { "\27LJ\2\n�\4\0\0\4\0\21\0\0276\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\4\0'\2\5\0B\0\2\0029\0\6\0005\2\b\0005\3\a\0=\3\t\0025\3\n\0=\3\v\0025\3\f\0=\3\r\0025\3\14\0=\3\15\0025\3\16\0=\3\17\0024\3\0\0=\3\18\2B\0\2\0016\0\0\0009\0\19\0'\2\20\0B\0\2\1K\0\1\0\25colorscheme material\bcmd\22custom_highlights\fdisable\1\0\4\14eob_lines\1\16term_colors\1\15background\2\fborders\1\20high_visibility\1\0\2\vdarker\2\flighter\1\23contrast_filetypes\1\4\0\0\rterminal\vpacker\aqf\fitalics\1\0\5\14variables\1\rcomments\1\fstrings\1\14functions\1\rkeywords\1\rcontrast\1\0\2\18async_loading\2\18lualine_style\fstealth\1\0\a\15popup_menu\1\24non_current_windows\1\16cursor_line\1\16sign_column\1\17line_numbers\1\21floating_windows\1\rsidebars\1\nsetup\rmaterial\frequire\vdarker\19material_style\6g\bvim\0" },
    loaded = true,
    path = "/home/lnk/.local/share/nvim/site/pack/packer/start/material.nvim",
    url = "https://github.com/marko-cerovac/material.nvim"
  },
  neoformat = {
    loaded = true,
    path = "/home/lnk/.local/share/nvim/site/pack/packer/start/neoformat",
    url = "https://github.com/sbdchd/neoformat"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n�\1\0\0\n\0\f\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\0\0'\2\3\0B\0\2\0026\1\0\0'\3\4\0B\1\2\0029\2\5\1\18\4\2\0009\2\6\2'\5\a\0009\6\b\0005\b\n\0005\t\t\0=\t\v\bB\6\2\0A\2\2\1K\0\1\0\rmap_char\1\0\0\1\0\1\btex\5\20on_confirm_done\17confirm_done\aon\nevent\bcmp\"nvim-autopairs.completion.cmp\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/home/lnk/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/lnk/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-cursorline"] = {
    config = { "\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0" },
    loaded = true,
    path = "/home/lnk/.local/share/nvim/site/pack/packer/start/nvim-cursorline",
    url = "https://github.com/yamatsum/nvim-cursorline"
  },
  ["nvim-gps"] = {
    config = { "\27LJ\2\n�\b\0\0\6\0\29\0'6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\b\0005\4\a\0005\5\6\0=\5\5\4=\4\t\0035\4\v\0005\5\n\0=\5\5\4=\4\f\0035\4\14\0005\5\r\0=\5\5\4=\4\15\0035\4\17\0005\5\16\0=\5\5\4=\4\18\0035\4\20\0005\5\19\0=\5\5\4=\4\21\0035\4\23\0005\5\22\0=\5\5\4=\4\24\0035\4\26\0005\5\25\0=\5\5\4=\4\27\3=\3\28\2B\0\2\1K\0\1\0\14languages\tyang\1\0\0\1\0\n\14list-name\t﬘ \18grouping-name\t \18identity-name\t \16action-name\t \17augment-path\t \14leaf-name\t \19leaf-list-name\t \16module-name\t \19container-name\t \17typedef-name\t \tyaml\1\0\0\1\0\a\17mapping-name\t \17integer-name\a# \17boolean-name\fﰰﰴ \15float-name\t \14null-name\v[] \16string-name\t \18sequence-name\t \fverilog\1\0\0\1\0\1\16module-name\t \ttoml\1\0\0\1\0\n\22inline-table-name\t \15float-name\t \17boolean-name\fﰰﰴ \14time-name\t \19date-time-name\t \14date-name\t \15table-name\t \15array-name\t \16string-name\t \17integer-name\a# \tnorg\1\0\0\1\0\1\15title-name\t \nlatex\1\0\0\1\0\2\15label-name\t \15title-name\a# \tjson\1\0\0\1\0\0\1\0\6\15array-name\t \16number-name\a# \17boolean-name\fﰰﰴ \16string-name\t \14null-name\v[] \16object-name\t \nicons\1\0\5\rtag-name\b炙\18function-name\t \15class-name\t \19container-name\t⛶ \16method-name\t \1\0\4\14separator\n  \26depth_limit_indicator\a..\18disable_icons\1\ndepth\3\0\nsetup\rnvim-gps\frequire\0" },
    loaded = true,
    path = "/home/lnk/.local/share/nvim/site/pack/packer/start/nvim-gps",
    url = "https://github.com/SmiteshP/nvim-gps"
  },
  ["nvim-lsp-installer"] = {
    config = { "\27LJ\2\n%\0\1\6\0\1\0\0064\1\0\0\18\4\0\0009\2\0\0\18\5\1\0B\2\3\1K\0\1\0\nsetupO\1\0\4\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\1\2\0003\3\3\0B\1\2\1K\0\1\0\0\20on_server_ready\23nvim-lsp-installer\frequire\0" },
    loaded = true,
    path = "/home/lnk/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0" },
    loaded = true,
    path = "/home/lnk/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n�\n\0\0\b\0004\0?6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0005\4\5\0004\5\0\0=\5\6\4=\4\a\3=\3\b\0025\3\f\0005\4\t\0005\5\n\0=\5\v\4=\4\r\3=\3\14\0025\3\15\0=\3\16\0025\3\17\0004\4\0\0=\4\18\3=\3\19\0024\3\0\0=\3\20\0025\3\21\0004\4\0\0=\4\22\3=\3\23\0025\3\24\0005\4\25\0=\4\v\3=\3\26\0025\3\27\0004\4\0\0=\4\28\0034\4\0\0=\4\29\3=\3\30\0025\3\31\0=\3 \0025\3!\0005\4\"\0=\4#\0035\4$\0005\5%\0005\6'\0005\a&\0=\a(\0065\a)\0=\a*\6=\6\29\5=\5+\4=\4,\3=\3-\0025\3.\0=\3/\0025\0030\0005\0041\0=\0042\3=\0033\2B\0\2\1K\0\1\0\blog\ntypes\1\0\5\ball\1\fprofile\1\vconfig\1\15copy_paste\1\bgit\1\1\0\2\rtruncate\1\venable\1\ntrash\1\0\2\20require_confirm\2\bcmd\ntrash\factions\14open_file\18window_picker\fbuftype\1\4\0\0\vnofile\rterminal\thelp\rfiletype\1\0\0\1\a\0\0\vnotify\vpacker\aqf\tdiff\rfugitive\18fugitiveblame\1\0\2\venable\2\nchars)ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890\1\0\2\18resize_window\1\17quit_on_open\1\15change_dir\1\0\2\vglobal\1\venable\2\1\0\1\25use_system_clipboard\2\bgit\1\0\3\ftimeout\3�\3\venable\2\vignore\2\ffilters\fexclude\vcustom\1\0\1\rdotfiles\1\16diagnostics\1\0\4\fwarning\b\nerror\b\tinfo\b\thint\b\1\0\2\17show_on_dirs\1\venable\1\16system_open\targs\1\0\0\23ignore_ft_on_setup\24update_focused_file\16ignore_list\1\0\2\15update_cwd\1\venable\1\23hijack_directories\1\0\2\14auto_open\2\venable\2\rrenderer\19indent_markers\1\0\0\nicons\1\0\3\tnone\a  \tedge\t│ \vcorner\t└ \1\0\1\venable\1\tview\rmappings\tlist\1\0\1\16custom_only\1\1\0\a\15signcolumn\byes preserve_window_proportions\1\tside\tleft\vnumber\1\vheight\3\30\nwidth\3\30\19relativenumber\1\1\0\f\15update_cwd\1\fsort_by\tname\16open_on_tab\1\23open_on_setup_file\1\18open_on_setup\1\27ignore_buffer_on_setup\1'hijack_unnamed_buffer_when_opening\1\17hijack_netrw\2\18hijack_cursor\1\21hide_root_folder\1\18disable_netrw\1\25auto_reload_on_write\2\nsetup\14nvim-tree\frequire\0" },
    loaded = true,
    path = "/home/lnk/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n�\4\0\0\6\0\21\0\0256\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0024\3\0\0=\3\6\0025\3\a\0005\4\b\0=\4\t\3=\3\n\0025\3\14\0005\4\v\0005\5\f\0=\5\r\4=\4\15\3=\3\16\0025\3\17\0005\4\18\0=\4\19\3=\3\20\2B\0\2\1K\0\1\0\frainbow\vcolors\1\b\0\0\f#90CAF9\f#9575CD\f#26A69A\f#EEFF41\f#BDBDBD\f#FF8A65\f#FF5252\1\0\3\venable\2\18extended_mode\2\19max_file_lines\3�\a\16textobjects\vselect\1\0\0\fkeymaps\1\0\4\aac\17@class.outer\aaf\20@function.outer\aif\20@function.inner\aic\17@class.inner\1\0\2\venable\2\14lookahead\2\14highlight\fdisable\1\3\0\0\6c\trust\1\0\2&additional_vim_regex_highlighting\1\venable\2\19ignore_install\21ensure_installed\1\0\1\17sync_install\1\1\4\0\0\6c\blua\trust\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/lnk/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/home/lnk/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-ts-autotag"] = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20nvim-ts-autotag\frequire\0" },
    loaded = true,
    path = "/home/lnk/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/home/lnk/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/lnk/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/lnk/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  sniprun = {
    config = { "\27LJ\2\n�\5\0\0\6\0\29\0#6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0=\3\4\0024\3\0\0=\3\5\0024\3\0\0=\3\6\0025\3\n\0005\4\b\0005\5\a\0=\5\t\4=\4\v\3=\3\f\0025\3\r\0=\3\14\0025\3\15\0=\3\16\0025\3\17\0=\3\18\0025\3\20\0005\4\19\0=\4\21\0035\4\22\0=\4\23\0035\4\24\0=\4\25\0035\4\26\0=\4\27\3=\3\28\2B\0\2\1K\0\1\0\18snipruncolors\26SniprunFloatingWinErr\1\0\2\afg\f#881515\fctermfg\fDarkRed\26SniprunVirtualTextErr\1\0\4\afg\f#000000\abg\f#881515\fctermbg\fDarkRed\vcterfg\nBlack\25SniprunFloatingWinOk\1\0\2\afg\f#66eeff\fctermfg\tCyan\25SniprunVirtualTextOk\1\0\0\1\0\4\afg\f#000000\abg\f#66eeff\fctermbg\tCyan\vcterfg\nBlack\19show_no_output\1\3\0\0\fClassic\23TempFloatingWindow\20display_options\1\0\2\25notification_timeout\3\5\19terminal_width\3-\fdisplay\1\3\0\0\fClassic\18VirtualTextOk\24interpreter_options\17GFM_original\1\0\0\21use_on_filetypes\1\0\0\1\2\0\0\20markdown.pandoc\17repl_disable\16repl_enable\26selected_interpreters\1\0\3\20inline_messages\3\0\fborders\vsingle\21live_mode_toggle\boff\nsetup\fsniprun\frequire\0" },
    loaded = true,
    path = "/home/lnk/.local/share/nvim/site/pack/packer/start/sniprun",
    url = "https://github.com/michaelb/sniprun"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/lnk/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/home/lnk/.local/share/nvim/site/pack/packer/start/vim-vsnip",
    url = "https://github.com/hrsh7th/vim-vsnip"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n�\1\0\0\n\0\f\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\0\0'\2\3\0B\0\2\0026\1\0\0'\3\4\0B\1\2\0029\2\5\1\18\4\2\0009\2\6\2'\5\a\0009\6\b\0005\b\n\0005\t\t\0=\t\v\bB\6\2\0A\2\2\1K\0\1\0\rmap_char\1\0\0\1\0\1\btex\5\20on_confirm_done\17confirm_done\aon\nevent\bcmp\"nvim-autopairs.completion.cmp\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: bufferline.nvim
time([[Config for bufferline.nvim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\foptions\1\0\0\1\0\3\bmod\fbuffers\fnumbers\tboth\16diagnostics\rnvim_lsp\nsetup\15bufferline\frequire\0", "config", "bufferline.nvim")
time([[Config for bufferline.nvim]], false)
-- Config for: dashboard-nvim
time([[Config for dashboard-nvim]], true)
try_loadstring("\27LJ\2\n�\5\0\0\2\0\6\0\t6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0005\1\5\0=\1\4\0K\0\1\0\1\16\0\0)                    .       .       )          .                         )       ,,/..,.   .       ..         )      .. *(/*,         .... .       )         .. .,,...,  ,.,*.,, .      )            ......//(,,,*.          )            ,,,.*(%#,*,.            )         ..,.,/**/,,, ..            )       , ..*//*(#*,(*(*   .         )     . .,/,,..(,*(/*/* *(*,.        )      ..   **#*/*%*.(*.*, .       . )       ...**,/*#%/#((/*///, . ..   .)..  ..,(/((/**(#(((/*((((//(/......,)(,./(/(/*/(*/(/(###(/(/,*/(/**/**///),,,,*.,.,**...*.*....**//(*(/,,,,...\28dashboard_custom_header\14telescope dashboard_default_executive\6g\bvim\0", "config", "dashboard-nvim")
time([[Config for dashboard-nvim]], false)
-- Config for: nvim-cursorline
time([[Config for nvim-cursorline]], true)
try_loadstring("\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0", "config", "nvim-cursorline")
time([[Config for nvim-cursorline]], false)
-- Config for: sniprun
time([[Config for sniprun]], true)
try_loadstring("\27LJ\2\n�\5\0\0\6\0\29\0#6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0=\3\4\0024\3\0\0=\3\5\0024\3\0\0=\3\6\0025\3\n\0005\4\b\0005\5\a\0=\5\t\4=\4\v\3=\3\f\0025\3\r\0=\3\14\0025\3\15\0=\3\16\0025\3\17\0=\3\18\0025\3\20\0005\4\19\0=\4\21\0035\4\22\0=\4\23\0035\4\24\0=\4\25\0035\4\26\0=\4\27\3=\3\28\2B\0\2\1K\0\1\0\18snipruncolors\26SniprunFloatingWinErr\1\0\2\afg\f#881515\fctermfg\fDarkRed\26SniprunVirtualTextErr\1\0\4\afg\f#000000\abg\f#881515\fctermbg\fDarkRed\vcterfg\nBlack\25SniprunFloatingWinOk\1\0\2\afg\f#66eeff\fctermfg\tCyan\25SniprunVirtualTextOk\1\0\0\1\0\4\afg\f#000000\abg\f#66eeff\fctermbg\tCyan\vcterfg\nBlack\19show_no_output\1\3\0\0\fClassic\23TempFloatingWindow\20display_options\1\0\2\25notification_timeout\3\5\19terminal_width\3-\fdisplay\1\3\0\0\fClassic\18VirtualTextOk\24interpreter_options\17GFM_original\1\0\0\21use_on_filetypes\1\0\0\1\2\0\0\20markdown.pandoc\17repl_disable\16repl_enable\26selected_interpreters\1\0\3\20inline_messages\3\0\fborders\vsingle\21live_mode_toggle\boff\nsetup\fsniprun\frequire\0", "config", "sniprun")
time([[Config for sniprun]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\n�\3\0\0\4\0\15\0\0296\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0009\0\3\0\18\2\0\0009\0\4\0'\3\5\0B\0\3\0016\0\0\0009\0\1\0009\0\3\0\18\2\0\0009\0\4\0'\3\6\0B\0\3\0016\0\a\0'\2\b\0B\0\2\0029\0\t\0005\2\n\0005\3\v\0=\3\f\0025\3\r\0=\3\14\2B\0\2\1K\0\1\0\20buftype_exclude\1\3\0\0\rterminal\vnofile\21filetype_exclude\1\22\0\0\rstartify\14dashboard\16dotooagenda\blog\rfugitive\14gitcommit\vpacker\fvimwiki\rmarkdown\tjson\btxt\nvista\thelp\ftodoist\rNvimTree\rpeekaboo\bgit\20TelescopePrompt\rundotree\24flutterToolsOutline\5\1\0\3\31show_current_context_start\2\25show_current_context\2\25space_char_blankline\6 \nsetup\21indent_blankline\frequire\feol:↴\14space:⋅\vappend\14listchars\tlist\bopt\bvim\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: cmp-nvim-lsp
time([[Config for cmp-nvim-lsp]], true)
try_loadstring("\27LJ\2\n;\0\1\4\0\4\0\0066\1\0\0009\1\1\0019\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\20vsnip#anonymous\afn\bvim�\a\1\0\n\0007\0�\0016\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\4\0'\2\5\0B\0\2\0029\1\6\0005\3\n\0005\4\b\0003\5\a\0=\5\t\4=\4\v\0034\4\0\0=\4\f\0039\4\r\0009\4\14\0049\4\15\0045\6\17\0009\a\r\0009\a\16\a)\t��B\a\2\2=\a\18\0069\a\r\0009\a\16\a)\t\4\0B\a\2\2=\a\19\0069\a\r\0009\a\20\aB\a\1\2=\a\21\0069\a\r\0009\a\22\aB\a\1\2=\a\23\0069\a\r\0009\a\24\a5\t\25\0B\a\2\2=\a\26\6B\4\2\2=\4\r\0039\4\27\0009\4\28\0044\6\3\0005\a\29\0>\a\1\0065\a\30\0>\a\2\0064\a\3\0005\b\31\0>\b\1\a4\b\3\0005\t \0>\t\1\bB\4\4\2=\4\28\3B\1\2\0019\1\6\0009\1!\1'\3\"\0005\4%\0009\5\27\0009\5\28\0054\a\3\0005\b#\0>\b\1\a4\b\3\0005\t$\0>\t\1\bB\5\3\2=\5\28\4B\1\3\0019\1\6\0009\1&\1'\3'\0005\4(\0009\5\r\0009\5\14\0059\5&\5B\5\1\2=\5\r\0044\5\3\0005\6)\0>\6\1\5=\5\28\4B\1\3\0019\1\6\0009\1&\1'\3*\0005\4+\0009\5\r\0009\5\14\0059\5&\5B\5\1\2=\5\r\0049\5\27\0009\5\28\0054\a\3\0005\b,\0>\b\1\a4\b\3\0005\t-\0>\t\1\bB\5\3\2=\5\28\4B\1\3\0016\1\4\0'\3.\0B\1\2\0029\1/\0016\3\0\0009\0030\0039\0031\0039\0032\3B\3\1\0A\1\0\0026\2\4\0'\0043\0B\2\2\0029\0024\0029\2\6\0025\0045\0=\0016\4B\2\2\1K\0\1\0\17capabilities\1\0\0\vclangd\14lspconfig\29make_client_capabilities\rprotocol\blsp\24update_capabilities\17cmp_nvim_lsp\1\0\1\tname\fcmdline\1\0\1\tname\tpath\1\0\0\6:\1\0\1\tname\vbuffer\1\0\0\6/\fcmdline\1\0\0\1\0\1\tname\vbuffer\1\0\1\tname\fcmp_git\14gitcommit\rfiletype\1\0\1\tname\nspell\1\0\1\tname\vbuffer\1\0\1\tname\nvsnip\1\0\1\tname\rnvim_lsp\fsources\vconfig\t<CR>\1\0\1\vselect\2\fconfirm\n<C-e>\nabort\14<C-Space>\rcomplete\n<C-f>\n<C-b>\1\0\0\16scroll_docs\vinsert\vpreset\fmapping\vwindow\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\bcmp\frequire\26menu,menuone,noselect\16completeopt\bopt\bvim\0", "config", "cmp-nvim-lsp")
time([[Config for cmp-nvim-lsp]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n�\n\0\0\b\0004\0?6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0005\4\5\0004\5\0\0=\5\6\4=\4\a\3=\3\b\0025\3\f\0005\4\t\0005\5\n\0=\5\v\4=\4\r\3=\3\14\0025\3\15\0=\3\16\0025\3\17\0004\4\0\0=\4\18\3=\3\19\0024\3\0\0=\3\20\0025\3\21\0004\4\0\0=\4\22\3=\3\23\0025\3\24\0005\4\25\0=\4\v\3=\3\26\0025\3\27\0004\4\0\0=\4\28\0034\4\0\0=\4\29\3=\3\30\0025\3\31\0=\3 \0025\3!\0005\4\"\0=\4#\0035\4$\0005\5%\0005\6'\0005\a&\0=\a(\0065\a)\0=\a*\6=\6\29\5=\5+\4=\4,\3=\3-\0025\3.\0=\3/\0025\0030\0005\0041\0=\0042\3=\0033\2B\0\2\1K\0\1\0\blog\ntypes\1\0\5\ball\1\fprofile\1\vconfig\1\15copy_paste\1\bgit\1\1\0\2\rtruncate\1\venable\1\ntrash\1\0\2\20require_confirm\2\bcmd\ntrash\factions\14open_file\18window_picker\fbuftype\1\4\0\0\vnofile\rterminal\thelp\rfiletype\1\0\0\1\a\0\0\vnotify\vpacker\aqf\tdiff\rfugitive\18fugitiveblame\1\0\2\venable\2\nchars)ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890\1\0\2\18resize_window\1\17quit_on_open\1\15change_dir\1\0\2\vglobal\1\venable\2\1\0\1\25use_system_clipboard\2\bgit\1\0\3\ftimeout\3�\3\venable\2\vignore\2\ffilters\fexclude\vcustom\1\0\1\rdotfiles\1\16diagnostics\1\0\4\fwarning\b\nerror\b\tinfo\b\thint\b\1\0\2\17show_on_dirs\1\venable\1\16system_open\targs\1\0\0\23ignore_ft_on_setup\24update_focused_file\16ignore_list\1\0\2\15update_cwd\1\venable\1\23hijack_directories\1\0\2\14auto_open\2\venable\2\rrenderer\19indent_markers\1\0\0\nicons\1\0\3\tnone\a  \tedge\t│ \vcorner\t└ \1\0\1\venable\1\tview\rmappings\tlist\1\0\1\16custom_only\1\1\0\a\15signcolumn\byes preserve_window_proportions\1\tside\tleft\vnumber\1\vheight\3\30\nwidth\3\30\19relativenumber\1\1\0\f\15update_cwd\1\fsort_by\tname\16open_on_tab\1\23open_on_setup_file\1\18open_on_setup\1\27ignore_buffer_on_setup\1'hijack_unnamed_buffer_when_opening\1\17hijack_netrw\2\18hijack_cursor\1\21hide_root_folder\1\18disable_netrw\1\25auto_reload_on_write\2\nsetup\14nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: nvim-ts-autotag
time([[Config for nvim-ts-autotag]], true)
try_loadstring("\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20nvim-ts-autotag\frequire\0", "config", "nvim-ts-autotag")
time([[Config for nvim-ts-autotag]], false)
-- Config for: material.nvim
time([[Config for material.nvim]], true)
try_loadstring("\27LJ\2\n�\4\0\0\4\0\21\0\0276\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\4\0'\2\5\0B\0\2\0029\0\6\0005\2\b\0005\3\a\0=\3\t\0025\3\n\0=\3\v\0025\3\f\0=\3\r\0025\3\14\0=\3\15\0025\3\16\0=\3\17\0024\3\0\0=\3\18\2B\0\2\0016\0\0\0009\0\19\0'\2\20\0B\0\2\1K\0\1\0\25colorscheme material\bcmd\22custom_highlights\fdisable\1\0\4\14eob_lines\1\16term_colors\1\15background\2\fborders\1\20high_visibility\1\0\2\vdarker\2\flighter\1\23contrast_filetypes\1\4\0\0\rterminal\vpacker\aqf\fitalics\1\0\5\14variables\1\rcomments\1\fstrings\1\14functions\1\rkeywords\1\rcontrast\1\0\2\18async_loading\2\18lualine_style\fstealth\1\0\a\15popup_menu\1\24non_current_windows\1\16cursor_line\1\16sign_column\1\17line_numbers\1\21floating_windows\1\rsidebars\1\nsetup\rmaterial\frequire\vdarker\19material_style\6g\bvim\0", "config", "material.nvim")
time([[Config for material.nvim]], false)
-- Config for: nvim-lsp-installer
time([[Config for nvim-lsp-installer]], true)
try_loadstring("\27LJ\2\n%\0\1\6\0\1\0\0064\1\0\0\18\4\0\0009\2\0\0\18\5\1\0B\2\3\1K\0\1\0\nsetupO\1\0\4\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\1\2\0003\3\3\0B\1\2\1K\0\1\0\0\20on_server_ready\23nvim-lsp-installer\frequire\0", "config", "nvim-lsp-installer")
time([[Config for nvim-lsp-installer]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n�\4\0\0\6\0\21\0\0256\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0024\3\0\0=\3\6\0025\3\a\0005\4\b\0=\4\t\3=\3\n\0025\3\14\0005\4\v\0005\5\f\0=\5\r\4=\4\15\3=\3\16\0025\3\17\0005\4\18\0=\4\19\3=\3\20\2B\0\2\1K\0\1\0\frainbow\vcolors\1\b\0\0\f#90CAF9\f#9575CD\f#26A69A\f#EEFF41\f#BDBDBD\f#FF8A65\f#FF5252\1\0\3\venable\2\18extended_mode\2\19max_file_lines\3�\a\16textobjects\vselect\1\0\0\fkeymaps\1\0\4\aac\17@class.outer\aaf\20@function.outer\aif\20@function.inner\aic\17@class.inner\1\0\2\venable\2\14lookahead\2\14highlight\fdisable\1\3\0\0\6c\trust\1\0\2&additional_vim_regex_highlighting\1\venable\2\19ignore_install\21ensure_installed\1\0\1\17sync_install\1\1\4\0\0\6c\blua\trust\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n�\5\0\0\b\0#\00086\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\n\0005\4\4\0005\5\5\0=\5\6\0045\5\a\0=\5\b\0044\5\0\0=\5\t\4=\4\v\0035\4\r\0005\5\f\0=\5\14\0045\5\15\0=\5\16\0044\5\3\0005\6\19\0009\a\17\0>\a\1\0069\a\18\0=\a\20\6>\6\1\5=\5\21\0045\5\22\0=\5\23\0045\5\24\0=\5\25\0045\5\26\0=\5\27\4=\4\28\0035\4\29\0004\5\0\0=\5\14\0044\5\0\0=\5\16\0045\5\30\0=\5\21\0045\5\31\0=\5\23\0044\5\0\0=\5\25\0044\5\0\0=\5\27\4=\4 \0034\4\0\0=\4!\0034\4\0\0=\4\"\3B\1\2\1K\0\1\0\15extensions\ftabline\22inactive_sections\1\2\0\0\rlocation\1\2\0\0\rfilename\1\0\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\4\0\0\rencoding\15fileformat\rfiletype\14lualine_c\tcond\1\0\0\17is_available\17get_location\14lualine_b\1\4\0\0\vbranch\tdiff\16diagnostics\14lualine_a\1\0\0\1\2\0\0\tmode\foptions\1\0\0\23disabled_filetypes\23section_separators\1\0\2\nright\b\tleft\b\25component_separators\1\0\2\nright\b\tleft\b\1\0\4\25always_divide_middle\2\17globalstatus\1\ntheme\rmaterial\18icons_enabled\2\nsetup\flualine\rnvim-gps\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: nvim-gps
time([[Config for nvim-gps]], true)
try_loadstring("\27LJ\2\n�\b\0\0\6\0\29\0'6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\b\0005\4\a\0005\5\6\0=\5\5\4=\4\t\0035\4\v\0005\5\n\0=\5\5\4=\4\f\0035\4\14\0005\5\r\0=\5\5\4=\4\15\0035\4\17\0005\5\16\0=\5\5\4=\4\18\0035\4\20\0005\5\19\0=\5\5\4=\4\21\0035\4\23\0005\5\22\0=\5\5\4=\4\24\0035\4\26\0005\5\25\0=\5\5\4=\4\27\3=\3\28\2B\0\2\1K\0\1\0\14languages\tyang\1\0\0\1\0\n\14list-name\t﬘ \18grouping-name\t \18identity-name\t \16action-name\t \17augment-path\t \14leaf-name\t \19leaf-list-name\t \16module-name\t \19container-name\t \17typedef-name\t \tyaml\1\0\0\1\0\a\17mapping-name\t \17integer-name\a# \17boolean-name\fﰰﰴ \15float-name\t \14null-name\v[] \16string-name\t \18sequence-name\t \fverilog\1\0\0\1\0\1\16module-name\t \ttoml\1\0\0\1\0\n\22inline-table-name\t \15float-name\t \17boolean-name\fﰰﰴ \14time-name\t \19date-time-name\t \14date-name\t \15table-name\t \15array-name\t \16string-name\t \17integer-name\a# \tnorg\1\0\0\1\0\1\15title-name\t \nlatex\1\0\0\1\0\2\15label-name\t \15title-name\a# \tjson\1\0\0\1\0\0\1\0\6\15array-name\t \16number-name\a# \17boolean-name\fﰰﰴ \16string-name\t \14null-name\v[] \16object-name\t \nicons\1\0\5\rtag-name\b炙\18function-name\t \15class-name\t \19container-name\t⛶ \16method-name\t \1\0\4\14separator\n  \26depth_limit_indicator\a..\18disable_icons\1\ndepth\3\0\nsetup\rnvim-gps\frequire\0", "config", "nvim-gps")
time([[Config for nvim-gps]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
