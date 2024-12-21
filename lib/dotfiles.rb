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

  # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
  sig { void }
  def run
    ensure_running_only_once do
      Apt.new.run
      Homebrew.new.run

      Kitty.new.run
      Git.new.run
      Tmux.new.run
      Atuin.new.run
      Zsh.new.run
      LazyGit.new.run
      Cursor.new.run
      Pry.new.run
      Hammerspoon.new.run

      LastRun.instance.update
    end
  end
  # rubocop:enable Metrics/MethodLength, Metrics/AbcSize

  private

  sig { params(blk: T.proc.void).void }
  def ensure_running_only_once(&blk)
    called = false
    if File.exist?(run_file)
      puts("Aborting since it is already running")
      return
    end

    File.write(run_file, "")

    blk.call
    called = true
  ensure
    File.delete(run_file) if called
  end

  sig { returns(String) }
  def run_file
    File.join(__dir__, ".running")
  end
end

Dotfiles.new.run
