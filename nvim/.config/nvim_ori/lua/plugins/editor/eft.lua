return function()
    -- " Disable highlight
    -- let g:eft_highlight = {}
    
    -- " Custom highlight
    -- let g:eft_highlight = {
    -- \   '1': {
    -- \     'highlight': 'EftChar',
    -- \     'allow_space': v:true,
    -- \     'allow_operator': v:true,
    -- \   },
    -- \   '2': {
    -- \     'highlight': 'EftSubChar',
    -- \     'allow_space': v:false,
    -- \     'allow_operator': v:false,
    -- \   },
    -- \   'n': {
    -- \     'highlight': 'EftSubChar',
    -- \     'allow_space': v:false,
    -- \     'allow_operator': v:false,
    -- \   }
    -- \ }

-- " You can pick your favorite strategies.
-- let g:eft_index_function = {
-- \   'head': function('eft#index#head'),
-- \   'tail': function('eft#index#tail'),
-- \   'space': function('eft#index#space'),
-- \   'camel': function('eft#index#camel'),
-- \   'symbol': function('eft#index#symbol'),
-- \ }

-- " You can use the below function like native `f`
-- let g:eft_index_function = {
-- \   'all': { -> v:true },
-- \ }
end