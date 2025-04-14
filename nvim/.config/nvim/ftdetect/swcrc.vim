augroup detect_swcrc
  autocmd!
  autocmd BufRead,BufNewFile .swcrc set filetype=jsonc
augroup END
