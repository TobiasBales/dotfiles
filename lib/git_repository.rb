# typed: strict
# frozen_string_literal: true

class GitRepository < Base
  extend T::Sig

  sig { params(repository: String, directory: String).void }
  def initialize(repository:, directory:)
    super()

    @repository = T.let(repository, String)
    @directory = T.let(directory.gsub("~", Dir.home), String)
  end

  sig { override.void }
  def run
    debug("Cloning #{@repository} to #{@directory}")
    if File.exist?(@directory)
      debug("Skipping since it already exists")
      return
    end

    `git clone #{@repository} #{@directory}`
  end
end
