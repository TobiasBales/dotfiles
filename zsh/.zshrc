export EDITOR=nvim
export HOMEBREW_NO_GOOGLE_ANALYTICS=true

setopt    appendhistory     #Append history to the history file (no overwriting)
setopt    sharehistory      #Share history across terminals
setopt    incappendhistory  #Immediately append to the history file, not just when a term is killed

fpath=("${HOME}/.zsh/completions" $fpath)

if [ -f /opt/homebrew/bin/mise ]; then
  eval "$(/opt/homebrew/bin/mise activate zsh)"
fi

if [ -d "${HOME}/.atuin/bin" ]; then
  export PATH=$PATH:"${HOME}/.atuin/bin"
  source "$HOME/.atuin/bin/env"
fi

if [ -f ~/.antigen.zsh ]; then
  source ~/.antigen.zsh
  antigen init ~/.antigenrc
fi

function t {
  PROJECT=$(basename $(pwd))
  SESSION=$(tmux ls | grep "^${PROJECT}:")
  if [[ -z "${SESSION}" ]]; then
    tmux new -s "${PROJECT}"
  else
    tmux attach -t "${PROJECT}"
  fi
}

function tc {
  tmux new-session -s "${1}-2" -t "${1}"
}

if [ -d /snap/bin ]; then
  export PATH=$PATH:/snap/bin
fi

if [ -d ~/go/bin ]; then
  export PATH=$PATH:~/go/bin
fi

PATH=$HOME/dotfiles/binaries:$PATH

alias vim=nvim
alias gg=lazygit

if [ -f ~/.zsh.secrets ]; then
  source ~/.zsh.secrets
fi


if [ -z "${TMUX}" ] && [ -z "${SSH_CLIENT}" ]; then
  t
fi

if command -v rbenv &> /dev/null; then
  eval "$(rbenv init - zsh)"
fi

if [ -f ~/dotfiles/setup ]; then
  ~/dotfiles/setup
fi

if command -v nodenv &> /dev/null; then
  eval "$(nodenv init - zsh)"
fi

if [ -f ~/.additional.zsh ]; then
  source ~/.additional.zsh
fi

eval "$(starship init zsh)"


[[ -f /opt/dev/sh/chruby/chruby.sh ]] && { type chruby >/dev/null 2>&1 || chruby () { source /opt/dev/sh/chruby/chruby.sh; chruby "$@"; } }

if [ -f /opt/homebrew/opt/chruby/share/chruby/chruby.sh ]; then
  source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
fi

[[ -x /opt/homebrew/bin/brew ]] && eval $(/opt/homebrew/bin/brew shellenv)
eval "$(atuin init zsh)"

if command -v atuin &> /dev/null; then
  atuin sync
fi

[ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh

if command -v gt &> /dev/null; then
  #compdef gt
  ###-begin-gt-completions-###
  #
  # yargs command completion script
  #
  # Installation: gt completion >> ~/.zshrc
  #    or gt completion >> ~/.zprofile on OSX.
  #
  _gt_yargs_completions()
  {
    local reply
    local si=$IFS
    IFS=$'
' reply=($(COMP_CWORD="$((CURRENT-1))" COMP_LINE="$BUFFER" COMP_POINT="$CURSOR" gt --get-yargs-completions "${words[@]}"))
    IFS=$si
    _describe 'values' reply
  }
  compdef _gt_yargs_completions gt
  ###-end-gt-completions-###
fi

