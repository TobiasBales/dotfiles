# typed: strict
# frozen_string_literal: true

require "find"
# find seems to walk files sorted alphabetically so we might need to load base before e.g. apt)
require_relative "base"

Find.find(File.join(File.expand_path(__dir__))) do |file|
  next if File.extname(file) != ".rb"

  next if file =~ %r{/base.rb$}
  next if file =~ %r{/dotfiles.rb$}

  load(file)
end

class Dotfiles
  extend T::Sig

  sig { void }
  def run
    Apt.new.run
    Homebrew.new.run

    Kitty.new.run
    Git.new.run
    Tmux.new.run
    Zsh.new.run
    NeoVim.new.run
    LazyGit.new.run
    VSCode.new.run
    Pry.new.run
    Hammerspoon.new.run

    LastRun.instance.update
  end
end

Dotfiles.new.run
