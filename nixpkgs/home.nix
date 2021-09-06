{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "nixos";
  home.homeDirectory = "/home/nixos";

  home.file.".config/awesome/rc.lua".source = ./awesome/rc.lua;
  home.file.".config/nvim/lua/dotfiles/compe.lua".source = ./nvim/lua/dotfiles/compe.lua;
  home.file.".config/nvim/lua/dotfiles/format.lua".source = ./nvim/lua/dotfiles/format.lua;
  home.file.".config/nvim/lua/dotfiles/gitsigns.lua".source = ./nvim/lua/dotfiles/gitsigns.lua;
  home.file.".config/nvim/lua/dotfiles/gps.lua".source = ./nvim/lua/dotfiles/gps.lua;
  home.file.".config/nvim/lua/dotfiles/init.lua".source = ./nvim/lua/dotfiles/init.lua;
  home.file.".config/nvim/lua/dotfiles/keybindings.lua".source = ./nvim/lua/dotfiles/keybindings.lua;
  home.file.".config/nvim/lua/dotfiles/lsp.lua".source = ./nvim/lua/dotfiles/lsp.lua;
  home.file.".config/nvim/lua/dotfiles/lualine.lua".source = ./nvim/lua/dotfiles/lualine.lua;
  home.file.".config/nvim/lua/dotfiles/neogit.lua".source = ./nvim/lua/dotfiles/neogit.lua;
  home.file.".config/nvim/lua/dotfiles/telescope.lua".source = ./nvim/lua/dotfiles/telescope.lua;
  home.file.".config/nvim/lua/dotfiles/treesitter.lua".source = ./nvim/lua/dotfiles/treesitter.lua;

  home.packages = with pkgs; [
    bat
    diff-so-fancy
    git-interactive-rebase-tool
    exa
    ripgrep
    tldr
  ];

  programs.kitty = {
    enable = true;
    font = {
      package = pkgs.fira-code;
      name = "Fira Code";
      size = 12;
    };
    settings = {
      foreground = "#ebdbb2";
      background = "#272727";
      selection_foreground = "#655b53";
      selection_background = "#ebdbb2";
      url_color = "#d65c0d";
      # black
      color0 = "#272727";
      color8 = "#928373";
      # red
      color1 = "#cc231c";
      color9 = "#fb4833";
      # green
      color2 = "#989719";
      color10 = "#b8ba25";
      # yellow
      color3 = "#d79920";
      color11 = "#fabc2e";
      # blue
      color4 = "#448488";
      color12 = "#83a597";
      # magenta
      color5 = "#b16185";
      color13 = "#d3859a";
      # cyan
      color6 = "#689d69";
      color14 = "#8ec07b";
      # white
      color7 = "#a89983";
      color15 = "#ebdbb2";
    };
  };

  programs.git = {
    enable = true;
    userName = "Tobias Bales";
    userEmail = "hi@tobiasbales.dev";
    aliases = {
    };
    extraConfig = {
      color = {
        branch = "auto";
	diff = "auto";
	interactive = "auto";
	status = "auto";
	ui = "auto";
      };
      branch = {
        autosetupmerge = "true";
      };
      core = {
        editor = "nvim";
	exludesfile = "~/.gitignore";
	autocrlf = "input";
	pager = "diff-so-fancy | less --tabs=4 -RFX";
      };
      init = {
        defaultBranch = "main";
      };
      pull = {
        rebase = "true";
      };
      push = {
        default = "simple";
	followTags = "true";
      };
      rebase = {
        autosquash = "true";
      };
      rerere = {
        enabled = "true";
      };
      sequence = {
        editor = "interactive-rebase-tool";
      };
      submodule = {
        recurse = "true";
      };
      status = {
        showUntrackedFiles = "all";
      };
    };
  };

  programs.neovim = {
    enable = true;
    vimAlias = true;
    extraConfig = ''
    set background=dark
    colorscheme gruvbox
    lua require("dotfiles")

    augroup highlight_yank
      autocmd!
      autocmd TextYankPost * silent! lua require('vim.highlight').on_yank({timeout = 40})
    augroup END

    set nofoldenable
    set foldmethod=expr
    set foldexpr=nvim_treesitter#foldexpr()
    set nocompatible
    set synmaxcol=300
    set ttyfast
    set lazyredraw
    silent !mkdir ~/.config/nvim/backup > /dev/null 2>&1
    set backupdir=~/.config/nvim/backup
    silent !mkdir ~/.config/nvim/swaps > /dev/null 2>&1
    set directory=~/.config/nvim/swaps
    silent !mkdir ~/.config/nvim/undo > /dev/null 2>&1
    set undodir=~/.config/nvim/undo
    set undofile
    set clipboard=unnamed
    set noerrorbells visualbell t_vb=
    set encoding=utf-8
    set nowrap
    set tabstop=2
    set shiftwidth=2
    set softtabstop=2
    set expandtab
    set hlsearch
    set incsearch
    set ignorecase
    set smartcase
    set rnu
    set nu
    set numberwidth=1
    set mouse=a
    set notimeout
    set ttimeout
    set timeoutlen=20
    set backspace=indent,eol,start
    " set fillchars+=vert:|
    set scrolloff=3
    set autoindent
    set autoread
    set showmode
    set showcmd
    set hidden
    set nocursorline
    set ruler
    set laststatus=2
    set concealcursor=""
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    '';
    extraPackages = with pkgs; [
      gcc
      nodejs
      nodePackages.npm
      lua
      tree-sitter
    ];
    plugins = with pkgs.vimPlugins; [
      delimitMate
      nvim-gps
      git-worktree-nvim
      neogit
      vim-tmux-navigator
      editorconfig-vim
      lualine-nvim
      nvim-compe
      nvim-tree-lua
      nvim-web-devicons
      gitsigns-nvim
      formatter-nvim
      vim-indent-object
      gruvbox
      nvim-lspconfig
      plenary-nvim
      popup-nvim
      telescope-fzy-native-nvim
      telescope-nvim
      nvim-treesitter
      nerdtree
      vim-bufkill
      vim-commentary
      vim-dadbod
      vim-endwise
      vim-eunuch
      vim-repeat
      vim-surround
      vim-unimpaired
    ];
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.tmux = {
    enable = true;
    terminal = "screen-256color";
    shortcut = "a";
    baseIndex = 1;
    keyMode = "vi";
    sensibleOnTop = true;
    plugins = with pkgs; [
      tmuxPlugins.sensible
      tmuxPlugins.vim-tmux-navigator
      tmuxPlugins.pain-control
      tmuxPlugins.gruvbox
    ];
    extraConfig = "
      set-option -g mouse on
      set-option -g allow-rename off
      set-option -g visual-activity off
      set-option -g visual-bell off
      set-option -g visual-silence off
      set-window-option -g monitor-activity off
      set-option -g bell-action none
      set-option -g renumber-windows on

      bind-key C-a send-prefix
    ";
  };

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    initExtra = ''
      function t {
        PROJECT=$(basename $(pwd))
	SESSION=$(tmux ls | grep "^''${PROJECT}:")
	if [[ -z "''${SESSION}" ]]; then
	  tmux new -s "''${PROJECT}"
	else
	  tmux attach -t "''${PROJECT}"
        fi
      }

      if [ -z "''${TMUX}" ]; then
        t
      fi

      if [ -f "''${HOME}/.secrets.zsh" ]; then
        source "''${HOME}/.secrets.zsh"
      fi
    '';
    shellAliases = {
      cat = "bat";
      la = "exa --all --long";
      ll = "exa --long";
      ls = "exa";
      man = "tldr";
      ta = "tmux attach -t ";
      tl = "tmux ls";
      tn = "tmux new -s ";
    };
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [
        "asdf"
        "git"
	"ripgrep"
        "sudo"
	"z"
      ];
    };
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.11";
}
