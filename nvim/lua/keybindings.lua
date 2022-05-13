local vimp = require('vimp')

-- exit insert mode with 
vimp.inoremap("jk", "<esc>")
-- save file using <leader>fs
vimp.nnoremap("<leader>fs", ":w<CR>")

-- make Y behave like D and C
vimp.nnoremap({'override'}, "Y", "y$")
-- center after searching
vimp.nnoremap("n", "nzzzv")
vimp.nnoremap("N", "Nzzzv")
-- keep position when joining lines
vimp.nnoremap("J", "mzJ`z")
-- add undo break for common symbosl
vimp.inoremap(",", ",<C-g>u")
vimp.inoremap(".", ".<C-g>u")
vimp.inoremap("!", "!<C-g>u")
vimp.inoremap("?", "?<C-g>u")
-- add relative moves to jump list
vimp.nnoremap("<expr> k", "(v:count > 5 ? \"m'\" . v:count : \"\") . 'k'")
vimp.nnoremap("<expr> j", "(v:count > 5 ? \"m'\" . v:count : \"\") . 'j'")

