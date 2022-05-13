require 'fileutils'

class Script < Base
  def initialize(file:)
    @file = file
    @executable = executable
  end

  def run
    debug("Running script #{@script}")

    if File.exists?(manifest)
      debug("Manifest for #{@script} already exists, skippping")
      return
    end

    `#{File.join(directory, 'scripts', @script)}`

    FileUtils.touch(manifest)
  end

  private

  def manifest
    File.join(directory, '.manifests', @script)
  end
end
