vim.o.background = "dark"
vim.cmd('colorscheme gruvbox')

local vimp = require('vimp')

vim.o.foldenable = false
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.synmaxcol = 300
vim.o.ttyfast = true
vim.o.lazyredraw = true
-- todo find the "native" way of doing this
vim.cmd [[silent !mkdir ~/.config/nvim/backup > /dev/null 2>&1]]
vim.cmd [[set backupdir=~/.config/nvim/backup]]
vim.cmd [[silent !mkdir ~/.config/nvim/swaps > /dev/null 2>&1]]
vim.cmd [[set directory=~/.config/nvim/swaps]]
vim.cmd [[silent !mkdir ~/.config/nvim/undo > /dev/null 2>&1]]
vim.cmd [[set undodir=~/.config/nvim/undo]]
vim.o.undofile = true
vim.o.clipboard = "unnamed"
vim.g.noerrorbells = true
vim.o.visualbell = true
vim.o.t_vb = ""
vim.o.encoding = "utf-8"
vim.g.nowrap = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.expandtab = true
vim.o.list = true
vim.o.listchars = "tab:»·,trail:·"
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.rnu = true
vim.o.nu = true
vim.o.numberwidth = 1
if vim.fn.has('mouse') == 1 then
  -- todo find the "native" way of doing this
  vim.cmd("set mouse=a")
end
-- todo find the "native" way of doing this
vim.cmd("set notimeout")
vim.o.ttimeout = true
vim.o.timeoutlen = 20
vim.o.backspace = "indent,eol,start"
vim.o.printfont = "PragmataPro:h12"
vim.o.fillchars = vim.o.fillchars .. "vert:│"
vim.o.scrolloff = 3
vim.o.autoindent = true
vim.o.autoread = true
vim.o.showmode = true
vim.o.showcmd = true
vim.o.hidden = true
vim.g.nocursorline = true
vim.o.ruler = true
vim.o.laststatus = 2
vim.o.concealcursor = ""

vim.cmd [[
  augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
  augroup END
]]

vim.cmd [[
  highlight nonascii guibg=Red ctermbg=5 term=standout
  au BufReadPost * syntax match nonascii "[^\x00-\x7F]" containedin=ALL
]]
