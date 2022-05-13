local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  -- integrate navigation between tmux and vim using ctrl+hjkl
  use("christoomey/vim-tmux-navigator")
  -- add :BD etc to close a buffer without killing the window
  use("qpkorr/vim-bufkill")
  -- status line
  use("hoob3rt/lualine.nvim")
  use("SmiteshP/nvim-gps")
  -- show git status in the gutter
  use("lewis6991/gitsigns.nvim")

  -- color theme
  use("morhetz/gruvbox")
  use("kyazdani42/nvim-web-devicons")

  -- allow binding lua functions directly to hotkeys
  use("svermeulen/vimpeccable")

  -- use region + c toggle comments on lines
  use("tpope/vim-commentary")

  use("folke/trouble.nvim")
  
  -- dependencies for telescope
  use("nvim-lua/plenary.nvim")
  use("nvim-lua/popup.nvim")

  -- fuzzy finding
  use({'nvim-telescope/telescope-fzf-native.nvim', run = 'make' })
  use("nvim-telescope/telescope.nvim")

  -- lsp for autocompletion/diagnostic
  use("neovim/nvim-lspconfig")

  -- package manager, listed again here so it does not remove itself
  use("wbthomason/packer.nvim")


  -- add text selection based on indentation
  use("michaeljsmith/vim-indent-object")

  -- close quotes etc automatically
  use("Raimondi/delimitMate")
  -- complete end for blocks/functions in ruby
  use("tpope/vim-endwise")
  -- commands to operating on files, eg :Delete, :Move, :Chmod etc
  use("tpope/vim-eunuch")
  -- add repeatition support for a lot of plugins, e.g. vim-surround, unimpaired etc
  use("tpope/vim-repeat")
  -- allow changing surrounding things, e.g. ' and "
  use("tpope/vim-surround")
  -- add closing ), }, ] etc when typing the opening version
  use("tpope/vim-unimpaired")

  -- syntax highlighting for all the languages
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
