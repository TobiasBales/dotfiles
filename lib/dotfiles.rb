# typed: strict
# frozen_string_literal: true

require "find"
require "sorbet-runtime"
# find seems to walk files sorted alphabetically so we might need to load base before e.g. apt)
require_relative "helpers"
require_relative "base"

Find.find(File.join(File.expand_path(__dir__))) do |file|
  next if File.extname(file) != ".rb"

  next if file =~ %r{/base.rb$}
  next if file =~ %r{/helpers.rb$}
  next if file =~ %r{/dotfiles.rb$}

  load(file)
end

class Dotfiles
  extend T::Sig

  sig { void }
  def run
    ensure_running_only_once do
      Apt.new.run
      Homebrew.new.run

      ran_tasks = T.let([Apt, Homebrew, LastRun], T::Array[T::Class[Base]])

      ObjectSpace.each_object(Class).select { |klass| klass < Base }.reverse.each do |task|
        task = T.cast(task, T::Class[Base])
        next if ran_tasks.include?(task)

        task.new.run
        ran_tasks << task
      end

      LastRun.instance.update
    end
  end

  private

  sig { params(blk: T.proc.void).void }
  def ensure_running_only_once(&blk)
    called = false
    if File.exist?(run_file)
      puts("Aborting since it is already running")
      return
    end
    called = true

    File.write(run_file, "")

    blk.call
  ensure
    File.delete(run_file) if called
  end

  sig { returns(String) }
  def run_file
    File.join(__dir__, "..", ".running")
  end
end

Dotfiles.new.run
