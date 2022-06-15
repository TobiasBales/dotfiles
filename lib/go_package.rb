# typed: strict
# frozen_string_literal: true

class GoPackage < Base
  extend T::Sig

  sig { params(package: String, executable: String).void }
  def initialize(package:, executable:)
    super()

    @package = package
    @executable = executable
  end

  sig { override.void }
  def run
    debug("Installing go package #{@package} for #{@executable}")

    if executable_exists?(@executable)
      debug("Already in path, skipping")
      return
    end

    puts `go install #{@package}`
  end
end
