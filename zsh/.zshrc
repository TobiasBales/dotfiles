export ZSH="$HOME/.oh-my-zsh"

export EDITOR=nvim

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

alias vim=nvim

if [ -f /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

if [ -f ~/.zsh.secrets ]; then
  source ~/.zsh.secrets
fi


if [ -z "${TMUX}" ] && [ -z "${SSH_CLIENT}" ]; then
  t
fi

if [ -f ~/dotfiles/setup ]; then
  ~/dotfiles/setup
fi

if command -v rbenv &> /dev/null; then
  eval "$(rbenv init - zsh)"
fi

if command -v nodenv &> /dev/null; then
  eval "$(nodenv init - zsh)"
fi

if [ -f /opt/homebrew/opt/fzf/shell/completion.zsh ]; then
  source /opt/homebrew/opt/fzf/shell/completion.zsh
fi

if [ -f /opt/homebrew/opt/fzf/shell/key-bindings.zsh ]; then
  source /opt/homebrew/opt/fzf/shell/key-bindings.zsh
fi

if [ -f /usr/share/doc/fzf/examples/key-bindings.zsh ]; then
  source /usr/share/doc/fzf/examples/key-bindings.zsh
fi

if [ -f /usr/share/doc/fzf/examples/completion.zsh ]; then
  source /usr/share/doc/fzf/examples/completion.zsh
fi

eval "$(starship init zsh)"
