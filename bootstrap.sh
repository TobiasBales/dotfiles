#!/usr/bin/env bash

set -uo pipefail

if [ "$(uname -s)" == "Darwin" ]; then
  $(git clone &> /dev/null)
  if [ $? -eq 1 ]; then
    echo "You probably need to install xcode dev tools (a dialog should have opened)."
    echo "Run this again after the setup is completed"
  fi
fi

if [ ! -d ~/dotfiles ]; then
  echo "Cloning dotfiles"
  git clone https://github.com/TobiasBales/dotfiles.git ~/dotfiles
fi

if [ "$(uname -s)" == "Darwin" ]; then
  if ! [ -x command -v brew &> /dev/null ]; then
    echo "Missing homebrew, installing it"
    /usr/bin/env bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi
fi

if ! [ -x command -v chruby &> /dev/null ]; then
  echo "Missing chruby, installing it"
  brew install chruby ruby-install
  set +u
  source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
  ruby-install --update ruby
  chruby $(chruby | head -n 1)
  set -u
fi

~/dotfiles/setup
