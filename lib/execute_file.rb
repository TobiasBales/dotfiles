class ExecuteFile < Base
  def initialize(url:, executable:)
    @url = url
    @executable = executable
  end

  def run
    debug("Fetching url #{@url} to execute")
    if executable_exists?(@executable)
      debug("Executable #{@executable} exists, skipping")
      return
    end

    `curl -fsSL #{@url} | sh -s -- -f`
  end
end
