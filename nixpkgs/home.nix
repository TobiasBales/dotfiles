{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "nixos";
  home.homeDirectory = "/home/nixos";

  home.file.".config/awesome/rc.lua".source = ./awesome/rc.lua;

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
