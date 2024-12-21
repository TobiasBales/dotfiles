# typed: strict
# frozen_string_literal: true

module Helpers
  extend T::Sig

  include Kernel

  sig { params(message: String).void }
  def debug(message)
    log(message, level: :debug)
  end

  sig { params(message: String, level: Symbol).void }
  def log(message, level: :info)
    puts(message) if level != :debug || debug?
    File.write(File.join(directory, ".log"), "#{message}\n", mode: "a+")
  end

  sig { returns(T::Boolean) }
  def debug?
    ENV.fetch("DEBUG", nil) == "true"
  end

  sig { params(sub_directory: T.nilable(String)).returns(String) }
  def directory(sub_directory: nil)
    base = File.expand_path(File.join(__dir__, ".."))

    return base if sub_directory.nil?

    File.join(base, sub_directory)
  end

  sig { params(file: String).returns(T::Boolean) }
  def file_exists?(file)
    File.exist?(file.gsub("~", Dir.home))
  end

  sig { params(executable: String).returns(T::Boolean) }
  def executable_exists?(executable)
    ENV.fetch("PATH", "").split(File::PATH_SEPARATOR).any? do |directory|
      File.executable?(File.join(directory, executable.to_s))
    end
  end
end
