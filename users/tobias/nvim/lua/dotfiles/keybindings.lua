vim.api.nvim_set_keymap("i", "jk", "<esc>", {noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>fb", "<cmd>Telescope buffers<cr>", {noremap = true})
vim.api.nvim_set_keymap(
  "n",
  "<Leader>fv",
  "<cmd>lua require('dotfiles.telescope').search_vimrc()<cr>",
  {noremap = true}
)
vim.api.nvim_set_keymap(
  "n",
  "<Leader>fd",
  "<cmd>lua require('dotfiles.telescope').search_dotfiles()<cr>",
  {noremap = true}
)
vim.api.nvim_set_keymap(
  "n",
  "<Leader>ff",
  "<cmd>lua require('dotfiles.telescope').search_files()<cr>",
  {noremap = true}
)
vim.api.nvim_set_keymap("n", "<Leader>fg", ":Telescope live_grep<cr>", {noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>fh", ":Telescope help_tags<cr>", {noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>gs", "<cmd>Neogit<cr>", {noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>fs", ":w<cr>", {noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>nt", "<cmd>NvimTreeToggle<cr>", {noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>nf", "<cmd>NvimTreeFindFile<cr>", {noremap = true})
vim.api.nvim_set_keymap("n", "Y", "y$", {noremap = true})
vim.api.nvim_set_keymap("n", "n", "nzzzv", {noremap = true})
vim.api.nvim_set_keymap("n", "J", "mzJ`z", {noremap = true})
vim.api.nvim_set_keymap("i", ",", ",<C-g>u", {noremap = true})
vim.api.nvim_set_keymap("i", ".", ".<C-g>u", {noremap = true})
vim.api.nvim_set_keymap("i", "!", "!<C-g>u", {noremap = true})
vim.api.nvim_set_keymap("i", "?", "?<C-g>u", {noremap = true})
vim.api.nvim_set_keymap("n", "<expr> k", '(v:count > 5 ? "m\'" . v:count : "") . \'k', {noremap = true})
vim.api.nvim_set_keymap("n", "<expr> j", '(v:count > 5 ? "m\'" . v:count : "") . \'j', {noremap = true})
vim.api.nvim_set_keymap("v", "<M-j>", ":m '>+1<cr>gv=gv", {noremap = true})
vim.api.nvim_set_keymap("v", "<M-k>", ":m '>-2<cr>gv=gv", {noremap = true})
vim.api.nvim_set_keymap("i", "<M-j>", "<esc>:m .+1<cr>==i", {noremap = true})
vim.api.nvim_set_keymap("i", "<M-k>", "<esc>:m .-2<cr>==i", {noremap = true})
vim.api.nvim_set_keymap("n", "<M-j>", ":m .+1<cr>==", {noremap = true})
vim.api.nvim_set_keymap("n", "<M-k>", ":m .-2<cr>==", {noremap = true})
