local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
local packer_bootstrap

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd [[packadd packer.nvim]]

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

  -- git integration
  use("kdheepak/lazygit.nvim")

  -- handle filename:line:colum
  use("wsdjeg/vim-fetch")

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

  -- linting
  use('mfussenegger/nvim-lint')

  -- lsp for autocompletion/diagnostic
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use {
    'neovim/nvim-lspconfig',
    config = [[
      require('plugins.lspconfig')
      ]]
  }
  use {
    'hrsh7th/nvim-cmp',
    config = [[
        require('plugins.nvim-cmp')
      ]],
    requires = {
      { 'kyazdani42/nvim-web-devicons', opt = true }
    },
  }
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-emoji'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-vsnip'

  -- colorize hex colors etc
  use {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require("colorizer").setup {}
    end
  }

  -- auto add pairs
  use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup {}
    end
  }

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
  use 'nvim-treesitter/playground'
  use 'nvim-treesitter/nvim-treesitter-refactor'
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'nvim-treesitter/nvim-treesitter-context'

  -- Debugging
  use 'mfussenegger/nvim-dap'
  use 'rcarriga/nvim-dap-ui'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
