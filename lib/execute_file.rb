# typed: strict
# frozen_string_literal: true

class ExecuteFile
  extend T::Sig
  include Helpers

  sig { params(url: String, executable: String).void }
  def initialize(url:, executable:)
    super()

    @url = url
    @executable = executable
  end

  sig { void }
  def run
    debug("Fetching url #{@url} to execute")
    if executable_exists?(@executable)
      debug("Executable #{@executable} exists, skipping")
      return
    end

    `curl -fsSL #{@url} | sh -s -- -f`
  end
end
