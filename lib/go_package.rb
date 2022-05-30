class GoPackage < Base
  def initialize(package:, executable:)
    @package = package
    @executable = executable
  end

  def run
    debug("Installing go package #{@package} for #{@executable}")

    if executable_exists?(@executable)
      debug("Already in path, skipping")
      return
    end

    puts `go install #{@package}`
  end
end
