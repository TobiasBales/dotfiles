class Script < Base
  def initialize(file:, executable:)
    @file = file
    @executable = executable
  end

  def run
    debug("Running script #{@script}")

    `#{File.join(directory, 'scripts', @script)}`
  end
end
