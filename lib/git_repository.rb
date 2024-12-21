# typed: strict
# frozen_string_literal: true

class GitRepository
  extend T::Sig
  include Helpers

  sig { params(repository: String, directory: String).void }
  def initialize(repository:, directory:)
    super()

    @repository = T.let(repository, String)
    @directory = T.let(directory.gsub("~", Dir.home), String)
  end

  sig { void }
  def run
    debug("Cloning #{@repository} to #{@directory}")
    if File.exist?(@directory)
      debug("Skipping since it already exists")
      return
    end

    %x(git clone #{@repository} #{@directory})
  end
end
