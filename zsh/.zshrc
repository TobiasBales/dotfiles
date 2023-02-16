
export EDITOR=nvim
export HOMEBREW_NO_GOOGLE_ANALYTICS=true

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


[[ -f /opt/dev/sh/chruby/chruby.sh ]] && type chruby >/dev/null 2>&1 || chruby () { source /opt/dev/sh/chruby/chruby.sh; chruby "$@"; }

[[ -x /opt/homebrew/bin/brew ]] && eval $(/opt/homebrew/bin/brew shellenv)
