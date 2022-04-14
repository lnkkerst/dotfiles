local vim = vim
require("plugins")
require("options")
require("autocmd")
require("neovide")



vim.g.dashboard_custom_header = {
    [[                    .       .       ]],
    [[          .                         ]],
    [[       ,,/..,.   .       ..         ]],
    [[      .. *(/*,         .... .       ]],
    [[         .. .,,...,  ,.,*.,, .      ]],
    [[            ......//(,,,*.          ]],
    [[            ,,,.*(%#,*,.            ]],
    [[         ..,.,/**/,,, ..            ]],
    [[       , ..*//*(#*,(*(*   .         ]],
    [[     . .,/,,..(,*(/*/* *(*,.        ]],
    [[      ..   **#*/*%*.(*.*, .       . ]],
    [[       ...**,/*#%/#((/*///, . ..   .]],
    [[..  ..,(/((/**(#(((/*((((//(/......,]],
    [[(,./(/(/*/(*/(/(###(/(/,*/(/**/**///]],
    [[,,,,*.,.,**...*.*....**//(*(/,,,,...]]
}

vim.g.mapleader = ","
vim.api.nvim_set_keymap("n", " ", "", {noremap = true})
vim.api.nvim_set_keymap("x", " ", "", {noremap = true})
require("keymap")